library(gsw)


### Name: gsw_CT_from_rho
### Title: Conservative Temperature from Density, Absolute Salinity and
###   Pressure
### Aliases: gsw_CT_from_rho

### ** Examples

rho <- c(1021.8484, 1022.2647, 1024.4207, 1027.7841, 1029.8287, 1031.9916)
SA <- c(   34.7118,   34.8915,   35.0256,   34.8472,   34.7366,   34.7324)
p <- c(         10,        50,       125,       250,       600,      1000)
r <- gsw_CT_from_rho(rho, SA, p)
expect_equal(r$CT, c(28.784377302226968, 28.432402127485858, 22.808745445250068,
                   10.260169334807866, 6.887336649146716, 4.404594162282834))



