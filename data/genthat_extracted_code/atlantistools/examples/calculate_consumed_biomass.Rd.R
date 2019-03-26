library(atlantistools)


### Name: calculate_consumed_biomass
### Title: Calculate the consumed biomass in [t] of prey j by predator i.
### Aliases: calculate_consumed_biomass

### ** Examples

# 1. Using built-in datasets.
d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")

bio_conv <- get_conv_mgnbiot(prm_biol = prm_biol)

df <- calculate_consumed_biomass(eat = ref_eat, grazing = ref_grazing, dm = ref_dm,
                                 vol = ref_vol, bio_conv = bio_conv)

# 2. Read in dataframes from existing Atlantis simulation.
bboxes <- get_boundary(boxinfo = load_box(file.path(d, "VMPA_setas.bgm")))
nc_gen <- file.path(d, "outputSETAS.nc")
nc_prod <- file.path(d, "outputSETASPROD.nc")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
init <- file.path(d, "INIT_VMPA_Jan2015.nc")

bps <- load_bps(fgs = fgs, init = init)

groups_age <- c("Planktiv_S_Fish", "Pisciv_S_Fish")
groups_rest <- c("Cephalopod", "Megazoobenthos", "Diatom", "Lab_Det", "Ref_Det")

df_eat <- load_nc(nc = nc_prod, bps = bps, fgs = fgs,
               select_groups = groups_age, select_variable = "Eat",
               prm_run = prm_run, bboxes = bboxes)
df_grz <- load_nc(nc = nc_prod, bps = bps, fgs = fgs,
               select_groups = groups_rest, select_variable = "Grazing",
               prm_run = prm_run, bboxes = bboxes)
df_dm <- load_dietcheck(dietcheck = file.path(d, "outputSETASDietCheck.txt"),
                        fgs = fgs, prm_run = prm_run, version_flag = 2, convert_names = TRUE)
vol <- load_nc_physics(nc = nc_gen, select_physics = "volume",
                       prm_run = prm_run, bboxes = bboxes, aggregate_layers = FALSE)

df <- calculate_consumed_biomass(eat = df_eat, grazing = df_grz, dm = df_dm,
                                 vol = vol, bio_conv = bio_conv)



