library(atlantistools)


### Name: load_init_age
### Title: This function loads weight at age data (in mgN) from the initial
###   conditions file.
### Aliases: load_init_age load_init_nonage load_init_stanza
###   load_init_physics load_init_weight

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
init <- file.path(d, "INIT_VMPA_Jan2015.nc")
fgs <- file.path(d, "SETasGroupsDem_NoCep.csv")
bboxes <- get_boundary(load_box(bgm = file.path(d, "VMPA_setas.bgm")))

bps <- load_bps(fgs = fgs, init = init)

# There are no values in the initial conditions file. Therefore atoutput is NA.
load_init_age(init = init, fgs = fgs, bboxes = bboxes,
              select_variable = "ResN",
              select_groups = "Planktiv_S_Fish")

load_init_age(init = init, fgs = fgs, bboxes = bboxes, select_variable = "ResN")
load_init_nonage(init = init, fgs = fgs, bboxes = bboxes, bps = bps,
   select_groups = "Megazoobenthos")
load_init_nonage(init = init, fgs = fgs, bboxes = bboxes, bps = bps)
load_init_stanza(init = init, fgs = fgs, bboxes = bboxes)
load_init_weight(init = init, fgs = fgs, bboxes = bboxes)



