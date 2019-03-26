library(gsw)


### Name: gsw_geo_strf_dyn_height_pc
### Title: Geostrophic Dynamic Height Anomaly (Piecewise-Constant Profile)
### Aliases: gsw_geo_strf_dyn_height_pc

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
delta_p <- c(10,      40,      75,     125,     350,     400)
r <- gsw_geo_strf_dyn_height_pc(SA, CT, delta_p)
expect_equal(r$dyn_height, c(-0.300346215853487, -1.755165998114308, -4.423531083131365,
                           -6.816659136254657, -9.453175257818430, -12.721009624991439))
expect_equal(r$p_mid/1e2, c(0.050000000000000, 0.300000000000000, 0.875000000000000,
                          1.875000000000000, 4.250000000000000, 8.000000000000000))



