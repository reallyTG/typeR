library(gsw)


### Name: gsw_pot_enthalpy_from_pt_ice
### Title: Potential Enthalpy of Ice
### Aliases: gsw_pot_enthalpy_from_pt_ice

### ** Examples

pt0_ice <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
e <- gsw_pot_enthalpy_from_pt_ice(pt0_ice)
expect_equal(e/1e5, c(-3.555459449611868, -3.608607069998877, -3.596153890859193,
                    -3.585123178806596, -3.557490528226009, -3.507198313847837))



