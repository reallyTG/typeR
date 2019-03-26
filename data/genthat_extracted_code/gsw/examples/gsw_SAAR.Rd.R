library(gsw)


### Name: gsw_SAAR
### Title: Absolute Salinity Anomaly Ratio
### Aliases: gsw_SAAR

### ** Examples

p <- c(10, 50, 125, 250, 600, 1000)
longitude <- c(188, 188, 188, 188, 188, 188)
latitude <- c(4, 4, 4, 4, 4, 4)
SAAR <- gsw_SAAR(p, longitude, latitude)
expect_equal(1e3*SAAR$SAAR, c(0.004794295602143, 0.007668755837570, 0.018919828449091,
                              0.077293264028981, 0.161974583039298, 0.270652408428964))
expect_equal(SAAR$in_ocean, rep(1, 6))



