library(gsw)


### Name: gsw_chem_potential_water_ice
### Title: Chemical Potential of Ice
### Aliases: gsw_chem_potential_water_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <- c(      10,       50,      125,      250,      600,      1000)
pot <- gsw_chem_potential_water_ice(t, p)
expect_equal(pot/1e4, c(-1.340648365149857, -1.644921413491445, -1.480991678890353,
                      -1.272436055728805, -0.711509477199393, 0.045575390357792))



