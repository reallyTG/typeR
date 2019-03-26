library(gsw)


### Name: gsw_pot_enthalpy_ice_freezing
### Title: Potential Enthalpy of Ice at Freezing Point
### Aliases: gsw_pot_enthalpy_ice_freezing

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(      10,      50,     125,     250,     600,    1000)
saturation_fraction = 1
e <- gsw_pot_enthalpy_ice_freezing(SA, p, saturation_fraction)
## Not run: 
##D expect_equal(e/1e5, c(-3.373409558967978, -3.374434164002012, -3.376117536928847,
##D                     -3.378453698871986, -3.385497832886802, -3.393768587631489))
## End(Not run)



