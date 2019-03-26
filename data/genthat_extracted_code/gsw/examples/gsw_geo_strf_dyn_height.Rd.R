library(gsw)


### Name: gsw_geo_strf_dyn_height
### Title: Geostrophic Dynamic Height Anomaly
### Aliases: gsw_geo_strf_dyn_height

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
p_ref <- 1000
dh <- gsw_geo_strf_dyn_height(SA, CT, p, p_ref)
expect_equal(dh, c(17.039204557769487, 14.665853784722286, 10.912861136923812,
                 7.567928838774945, 3.393524055565328, 0))



