library(gsw)


### Name: gsw_pt_from_pot_enthalpy_ice_poly
### Title: Potential Temperature from Potential Enthalpy of Ice (Polynomial
###   version)
### Aliases: gsw_pt_from_pot_enthalpy_ice_poly

### ** Examples

pot_enthalpy_ice <- c(-3.5544e5, -3.6033e5, -3.5830e5, -3.5589e5, -3.4948e5, -3.4027e5)
pt <- gsw_pt_from_pot_enthalpy_ice_poly(pot_enthalpy_ice)
expect_equal(pt, c(-10.733085986035007, -13.167396204945987, -12.154204137867396,
                 -10.956201046447006, -7.794963341294590, -3.314907552013722))



