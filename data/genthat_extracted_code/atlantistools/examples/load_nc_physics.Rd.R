library(atlantistools)


### Name: load_nc_physics
### Title: Load Atlantis outputfiles (netcdf)
### Aliases: load_nc_physics
### Keywords: gen

### ** Examples

d <- system.file("extdata", "setas-model-new-becdev", package = "atlantistools")
nc <- file.path(d, "outputSETAS.nc")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_New.prm")
bboxes <- get_boundary(boxinfo = load_box(file.path(d, bgm = "VMPA_setas.bgm")))
select_physics <- c("salt", "NO3", "volume")

test <- load_nc_physics(nc, select_physics, prm_run, bboxes)
str(test)

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
nc <- file.path(d, "outputSETAS.nc")
prm_run <- file.path(d, "VMPA_setas_run_fishing_F_Trunk.prm")
bboxes <- get_boundary(boxinfo = load_box(file.path(d, bgm = "VMPA_setas.bgm")))

test <- load_nc_physics(nc, select_physics, prm_run, bboxes)
str(test)

test <- load_nc_physics(nc, select_physics = "nominal_dz", prm_run, bboxes)



