library(atlantistools)


### Name: load_init
### Title: This function is used to read in data from the initial
###   conditions file.
### Aliases: load_init

### ** Examples

d <- system.file("extdata", "setas-model-new-trunk", package = "atlantistools")
init <- file.path(d, "INIT_VMPA_Jan2015.nc")

load_init(init, vars = "Planktiv_S_Fish1_Nums")
load_init(init, vars = c("Planktiv_S_Fish2_ResN", "Planktiv_S_Fish3_ResN"))
load_init(init, vars = "Megazoobenthos_N")

## Not run: 
##D dir <- "C:/Users/siebo/Documents/Atlantis/BalticAtlantis/run_files_73days_Nej"
##D init <- file.path(dir, "new_init_Baltic_05Dec2015_v2.nc")
##D vars <- "Sprat1_ResN"
##D load_init(init = init, vars = vars)
## End(Not run)



