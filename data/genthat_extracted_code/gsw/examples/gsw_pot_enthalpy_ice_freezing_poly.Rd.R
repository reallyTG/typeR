library(gsw)


### Name: gsw_pot_enthalpy_ice_freezing_poly
### Title: Potential Enthalpy of Ice at Freezing Point (Polynomial version)
### Aliases: gsw_pot_enthalpy_ice_freezing_poly

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(      10,      50,     125,     250,     600,    1000)
saturation_fraction = 1
e <- gsw_pot_enthalpy_ice_freezing_poly(SA, p, saturation_fraction)
expect_equal(e/1e5, c(-3.373370858777002, -3.374395733068549, -3.376079507278181,
                    -3.378416106344322, -3.385460970578123, -3.393731732645173))



