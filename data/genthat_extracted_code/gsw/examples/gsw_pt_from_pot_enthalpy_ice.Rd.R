library(gsw)


### Name: gsw_pt_from_pot_enthalpy_ice
### Title: Potential Temperature from Potential Enthalpy of Ice
### Aliases: gsw_pt_from_pot_enthalpy_ice

### ** Examples

pot_enthalpy_ice <- c(-3.5544e5, -3.6033e5, -3.5830e5, -3.5589e5, -3.4948e5, -3.4027e5)
pt <- gsw_pt_from_pot_enthalpy_ice(pot_enthalpy_ice)
expect_equal(pt, c(-10.733087588125384, -13.167397822300588, -12.154205899172704,
                 -10.956202704066083, -7.794963180206421, -3.314905214262531))



