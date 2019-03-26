## ------------------------------------------------------------------------
library("atlantistools")
library("ggplot2")
library("gridExtra")
library("dplyr")

# You should be able to build the vignette either by clicking on "Knit" in RStudio or with
# rmarkdown::render("model-preprocess.Rmd")

## ------------------------------------------------------------------------
d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

nc_gen    <- file.path(d, "outputSETAS.nc")
nc_prod   <- file.path(d, "outputSETASPROD.nc")
dietcheck <- file.path(d, "outputSETASDietCheck.txt")
yoy       <- file.path(d, "outputSETASYOY.txt")
ssb       <- file.path(d, "outputSETASSSB.txt")
prm_run   <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
prm_biol  <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs       <- file.path(d, "SETasGroupsDem_NoCep.csv")
bgm       <- file.path(d, "VMPA_setas.bgm")
init      <- file.path(d, "INIT_VMPA_Jan2015.nc")

## ------------------------------------------------------------------------
bboxes <- get_boundary(boxinfo = load_box(bgm))
bps <- load_bps(fgs, init)
bio_conv <- get_conv_mgnbiot(prm_biol)

# By default data from all groups within the simulation is extracted!
groups <- get_groups(fgs)
groups_age <- get_age_groups(fgs)
groups_rest <- groups[!groups %in% groups_age]

## ------------------------------------------------------------------------
# Read in raw untransformed data from nc_gen
vars <- list("Nums", "StructN", "ResN", "N")
grps <- list(groups_age, groups_age, groups_age, groups_rest)
dfs_gen <- Map(load_nc, select_variable = vars, select_groups = grps,
               MoreArgs = list(nc = nc_gen, bps = bps, fgs = fgs, prm_run = prm_run, bboxes = bboxes))

# Read in raw untransformed data from nc_prod
vars <- list("Eat", "Grazing", "Growth")
grps <- list(groups_age, groups_rest, groups_age)
dfs_prod <- Map(load_nc, select_variable = vars, select_groups = grps,
                MoreArgs = list(nc = nc_prod, bps = bps, fgs = fgs, prm_run = prm_run, bboxes = bboxes))

# Read in physics
flux <- load_nc_physics(nc = nc_gen, select_physics = c("eflux", "vflux"),
                        prm_run = prm_run, bboxes = bboxes)

sink <- load_nc_physics(nc = nc_gen, select_physics = c("hdsource", "hdsink"),
                        prm_run = prm_run, bboxes = bboxes)

physics <- load_nc_physics(nc = nc_gen, 
                           select_physics = c("salt", "NO3", "NH3", "Temp", "Chl_a", "Denitrifiction"),
                           prm_run = prm_run, bboxes = bboxes)

# exclude sediment layer from salinity
physics <- filter(physics, !(variable == "salt" & layer == max(layer) & time == min(time)))
# exlucde water column from Denitrifiction
physics <- filter(physics, !(variable == "Denitrifiction" & layer != max(layer) & time == min(time)))

vol_dz <- load_nc_physics(nc = nc_gen, select_physics = c("volume", "dz"),
                          prm_run = prm_run, bboxes = bboxes)

dz <- dplyr::filter(vol_dz, variable == "dz")
vol <- dplyr::filter(vol_dz, variable == "volume")

nominal_dz <- load_init(init = init, vars = "nominal_dz") %>% 
  as.data.frame() %>% 
  dplyr::filter(!is.na(layer))

# Read in Dietcheck
df_dm <- load_dietcheck(dietcheck = dietcheck,
                        fgs = fgs, prm_run = prm_run, convert_names = TRUE)

# Read in SSB/R
ssb_rec <- load_rec(yoy = yoy, ssb = ssb, prm_biol = prm_biol)

# Read in misc  
df_agemat <- prm_to_df(prm_biol = prm_biol, fgs = fgs, group = get_age_acronyms(fgs), parameter = "age_mat")
dietmatrix <- load_dietmatrix(prm_biol, fgs, convert_names = TRUE)

## ------------------------------------------------------------------------
# Calculate biomass spatially
bio_sp <- calculate_biomass_spatial(nums = dfs_gen[[1]], sn = dfs_gen[[2]], rn = dfs_gen[[3]], n = dfs_gen[[4]],
                                    vol_dz = vol_dz, bio_conv = bio_conv, bps = bps)

# Aggregate spatial biomass to based on stanzas
bio_sp_stanza <- combine_ages(bio_sp, grp_col = "species", agemat = df_agemat)

# Aggregate biomass
biomass <- bio_sp %>%
  agg_data(groups = c("species", "time"), fun = sum)

biomass_age <- bio_sp %>%
  filter(agecl > 2) %>%
  agg_data(groups = c("species", "agecl", "time"), fun = sum)

# Aggregate Numbers! This is done seperately since numbers need to be summed!
nums     <- agg_data(data = dfs_gen[[1]], groups = c("species", "time"), fun = sum)
nums_age <- agg_data(data = dfs_gen[[1]], groups = c("species", "agecl", "time"), fun = sum)
nums_box <- agg_data(data = dfs_gen[[1]], groups = c("species", "polygon", "time"), fun = sum)

# Aggregate the rest of the dataframes by mean!
structn_age <- agg_data(data = dfs_gen[[2]],  groups = c("species", "time", "agecl"), fun = mean)
resn_age    <- agg_data(data = dfs_gen[[3]],  groups = c("species", "time", "agecl"), fun = mean)
eat_age     <- agg_data(data = dfs_prod[[1]], groups = c("species", "time", "agecl"), fun = mean)
grazing     <- agg_data(data = dfs_prod[[2]], groups = c("species", "time"), fun = mean)
growth_age  <- agg_data(data = dfs_prod[[3]], groups = c("species", "time", "agecl"), fun = mean)

# Calculate consumed biomass
bio_cons <- calculate_consumed_biomass(eat = dfs_prod[[1]], grazing = dfs_prod[[2]], dm = df_dm,
                                       vol = vol, bio_conv = bio_conv) %>%
  agg_data(groups = c("pred", "agecl", "time", "prey"), fun = sum)

# Calculate spatial overlap
sp_overlap <- calculate_spatial_overlap(biomass_spatial = bio_sp, dietmatrix = dietmatrix, agemat = df_agemat)

# Growth relative to initial conditions
rec_weight <- prm_to_df(prm_biol = prm_biol, fgs = fgs, 
                        group = get_age_acronyms(fgs = fgs), 
                        parameter = c("KWRR", "KWSR", "AgeClassSize"))

pd <- load_init_weight(init = init, fgs = fgs, bboxes = bboxes) %>%
  left_join(rec_weight) %>%
  split(.$species)

# Calculate weight difference from one ageclass to the next!
for (i in seq_along(pd)) {
  pd[[i]]$wdiff <- c((pd[[i]]$rn[1] + pd[[i]]$sn[1]) - (pd[[i]]$kwrr[1] + pd[[i]]$kwsr[1]),
                     diff(pd[[i]]$rn + pd[[i]]$sn))
}
pd <- do.call(rbind, pd)
pd$growth_req <- pd$wdiff / (365 * pd$ageclasssize)
if (any(pd$growth_req < 0)) {
  warning("Required growth negative for some groups. Please check your initial conditions files.")
}

gr_req <- pd %>%
  select(species, agecl, growth_req)

gr_rel_init <- growth_age %>%
  left_join(gr_req) %>%
  mutate(gr_rel = (atoutput - growth_req) / growth_req)

# Aggregate volume vertically.
vol_ts <- agg_data(vol, groups = c("time", "polygon"), fun = sum, out = "volume")


## ------------------------------------------------------------------------
  result <- list(
    "biomass"                = biomass,       #1
    "biomass_age"            = biomass_age,
    "biomass_consumed"       = bio_cons,
    "biomass_spatial_stanza" = bio_sp_stanza,
    "diet"                   = df_dm,         #5 
    "dz"                     = dz,
    "eat_age"                = eat_age,       
    "flux"                   = flux,
    "grazing"                = grazing,
    "growth_age"             = growth_age,    #10
    "growth_rel_init"        = gr_rel_init,
    "nominal_dz"             = nominal_dz,
    "nums"                   = nums,
    "nums_age"               = nums_age,      
    "nums_box"               = nums_box,      #15
    "physics"                = physics,
    "resn_age"               = resn_age,
    "sink"                   = sink,
    "spatial_overlap"        = sp_overlap,    
    "ssb_rec"                = ssb_rec,       #20
    "structn_age"            = structn_age,    
    "vol"                    = vol_ts
  )

