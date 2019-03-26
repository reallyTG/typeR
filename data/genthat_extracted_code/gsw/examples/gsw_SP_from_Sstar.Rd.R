library(gsw)


### Name: gsw_SP_from_Sstar
### Title: Practical Salinity from Preformed Salinity
### Aliases: gsw_SP_from_Sstar

### ** Examples

Sstar <- c(34.7115, 34.8912, 35.0247, 34.8436, 34.7291, 34.7197)
p <- c(         10,      50,     125,     250,     600,    1000)
longitude <- 188
latitude <- 4
SP <- gsw_SP_from_Sstar(Sstar, p, longitude, latitude)
expect_equal(SP, c(34.548646570969929, 34.727538423586189, 34.860549501859502,
                   34.681006826476434, 34.568065697992346, 34.560023926979518))



