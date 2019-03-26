library(atlantistools)


### Name: sc_init
### Title: Sanity check initial conditions file
### Aliases: sc_init plot_sc_init

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
init <- file.path(d, "INIT_VMPA_Jan2015.nc")
prm_biol <- file.path(d, "VMPA_setas_biol_fishing_Trunk.prm")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
bboxes <- get_boundary(load_box(bgm = file.path(d, "VMPA_setas.bgm")))

data1 <- sc_init(init, prm_biol, fgs, bboxes)
## Not run: 
##D dir <- system.file("extdata", "gns", package = "atlantistools")
##D fgs <- "functionalGroups.csv"
##D init <- "init_simple_NorthSea.nc"
##D prm_biol <- "NorthSea_biol_fishing.prm"
##D bboxes <- get_boundary(load_box(dir = dir, bgm = "NorthSea.bgm"))
##D mult_mum <- seq(0.5, 10, by = 1)
##D mult_c <- seq(0.5, 10, by = 1)
##D no_avail <- FALSE
##D save_to_disc <- FALSE
##D data1 <- sc_init(dir, init, prm_biol, fgs, bboxes, save_to_disc = FALSE)
##D plot_sc_init(df = data1, mult_mum, mult_c)
##D plot_sc_init(df = data1, mult_mum, mult_c, pred = "Cod")
##D 
##D data2 <- sc_init(dir, init, prm_biol, fgs, bboxes, pred = "Cod", save_to_disc = FALSE)
##D plot_sc_init(df = data2, mult_mum, mult_c)
## End(Not run)



