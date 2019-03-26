library(spant)


### Name: fit_mrs
### Title: Perform a fit based analysis of MRS data.
### Aliases: fit_mrs

### ** Examples

fname <- system.file("extdata","philips_spar_sdat_WS.SDAT",package="spant")
svs <- read_mrs(fname, format="spar_sdat")
## Not run: 
##D basis <- sim_basis_1h_brain_press(svs)
##D fit_result <- fit_mrs(svs, basis)
## End(Not run)



