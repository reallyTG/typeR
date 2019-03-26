library(atlantistools)


### Name: load_nc
### Title: Load Atlantis outputfiles (netcdf)
### Aliases: load_nc
### Keywords: gen

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")

nc <- file.path(d, "outputSETAS.nc")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
bps <- load_bps(init = file.path(d, "INIT_VMPA_Jan2015.nc"), fgs = fgs)
bboxes <- get_boundary(boxinfo = load_box(bgm = file.path(d, "VMPA_setas.bgm")))
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")

test <- load_nc(nc = nc, bps = bps, fgs = fgs, prm_run = prm_run, bboxes = bboxes,
  select_groups = c("Planktiv_S_Fish", "Cephalopod", "Diatom"),
  select_variable = "ResN")

test <- load_nc(nc = nc, bps = bps, fgs = fgs, prm_run = prm_run, bboxes = bboxes,
  select_groups = c("Planktiv_S_Fish", "Cephalopod", "Diatom"),
  select_variable = "Nums")



