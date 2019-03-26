library(gsw)


### Name: gsw_pressure_coefficient_ice
### Title: Pressure Coefficient for Ice
### Aliases: gsw_pressure_coefficient_ice

### ** Examples

t <- c(-10.7856, -13.4329, -12.8103, -12.2600,  -10.8863,  -8.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
pc <- gsw_pressure_coefficient_ice(t, p)
expect_equal(pc/1e6, c(1.333098059787838, 1.326359005133730, 1.327354133828322,
                     1.327793888831923, 1.328549609231685, 1.331416733490227))



