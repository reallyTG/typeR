library(atlantistools)


### Name: calculate_biomass_spatial
### Title: Calculate spatially explicit biomass (in [t]) for each group and
###   ageclass per timestep.
### Aliases: calculate_biomass_spatial

### ** Examples

# 1. Using built in datasets.
d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
init <- file.path(d, "INIT_VMPA_Jan2015.nc")
bps <- load_bps(fgs = fgs, init = init)

bio_conv <- get_conv_mgnbiot(prm_biol = prm_biol)

df <- calculate_biomass_spatial(nums = ref_nums, sn = ref_structn, rn = ref_resn, n = ref_n,
                                vol_dz = ref_vol_dz, bio_conv = bio_conv, bps = bps)

# 2. Read in dataframes from existing Atlantis simulation.
bboxes <- get_boundary(boxinfo = load_box(file.path(d, "VMPA_setas.bgm")))
nc_gen <- file.path(d, "outputSETAS.nc")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")

groups_age <- c("Planktiv_S_Fish", "Pisciv_S_Fish")
groups_rest <- c("Cephalopod", "Megazoobenthos", "Diatom", "Lab_Det", "Ref_Det")

nums <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
                select_groups = groups_age, select_variable = "Nums",
                prm_run = prm_run, bboxes = bboxes)
sn <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
              select_groups = groups_age, select_variable = "StructN",
              prm_run = prm_run, bboxes = bboxes)
rn <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
              select_groups = groups_age, select_variable = "ResN",
              prm_run = prm_run, bboxes = bboxes)
n <- load_nc(nc = nc_gen, bps = bps, fgs = fgs,
             select_groups = groups_rest, select_variable = "N",
             prm_run = prm_run, bboxes = bboxes)
vol <- load_nc_physics(nc = nc_gen, select_physics = c("volume", "dz"),
                       prm_run = prm_run, bboxes = bboxes, aggregate_layers = FALSE)

df <- calculate_biomass_spatial(nums = nums, sn = sn, rn = rn, n = n, vol_dz = vol,
                                bio_conv = bio_conv, bps = bps)

# 3. Read in dataframes from existing Atlantis simulation with Map().
vars <- list("Nums", "StructN", "ResN", "N")
grps <- list(groups_age, groups_age, groups_age, groups_rest)
dfs <- Map(load_nc, select_variable = vars, select_groups = grps,
           MoreArgs = list(nc = nc_gen, bps = bps, fgs = fgs,
                           prm_run = prm_run, bboxes = bboxes))

df <- calculate_biomass_spatial(nums = dfs[[1]], sn = dfs[[2]], rn = dfs[[3]], n = dfs[[4]],
                                vol_dz = vol, bio_conv = bio_conv, bps = bps)



