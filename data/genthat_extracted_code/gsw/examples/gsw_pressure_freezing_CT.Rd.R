library(gsw)


### Name: gsw_pressure_freezing_CT
### Title: Pressure at which Seawater Freezes
### Aliases: gsw_pressure_freezing_CT

### ** Examples

SA <- c(                 34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(                 -1.8996, -1.9407, -2.0062, -2.0923, -2.3593, -2.6771)
saturation_fraction <- c(       1,    0.8,     0.6,     0.5,     0.4,       0)
p <- gsw_pressure_freezing_CT(SA, CT, saturation_fraction)
expect_equal(p/1e3, c(0.009890530270710, 0.050376026585933, 0.125933117050624,
                    0.251150973076077, 0.601441775836021, 1.002273338145043))



