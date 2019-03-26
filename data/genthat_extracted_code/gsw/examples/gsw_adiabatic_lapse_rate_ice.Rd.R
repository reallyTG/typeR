library(gsw)


### Name: gsw_adiabatic_lapse_rate_ice
### Title: Adiabatic Lapse Rate of Ice
### Aliases: gsw_adiabatic_lapse_rate_ice

### ** Examples

t  <- c(-10.7856, -13.4329, -12.8103, -12.2600, -10.8863, -8.4036)
p <- c(       10,       50,      125,      250,      600,    1000)
lr <- gsw_adiabatic_lapse_rate_ice(t, p)
expect_equal(lr*1e7, c(0.218777853913651, 0.216559115188599, 0.216867659957613,
                     0.216988337914416, 0.217182707402780, 0.218100558740840))



