library(gsw)


### Name: gsw_pot_enthalpy_from_pt_ice_poly
### Title: Potential Enthalpy of Ice (Polynomial version)
### Aliases: gsw_pot_enthalpy_from_pt_ice_poly

### ** Examples

pt0_ice <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
e <- gsw_pot_enthalpy_from_pt_ice_poly(pt0_ice)
expect_equal(e/1e5, c(-3.555459482216265, -3.608607100959428, -3.596153924697033,
                    -3.585123214031169, -3.557490561327994, -3.507198320793373))



