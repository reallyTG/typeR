library(gsw)


### Name: gsw_SA_from_rho
### Title: Compute Absolute Salinity from Density, etc
### Aliases: gsw_SA_from_rho

### ** Examples

rho <- c(1021.8482, 1022.2647, 1024.4207, 1027.7841, 1029.8287, 1031.9916)
CT <-c(    28.7856,   28.4329,   22.8103,   10.2600,    6.8863,    4.4036)
p <- c(         10,        50,       125,       250,       600,      1000)
SA <- gsw_SA_from_rho(rho, CT, p)
expect_equal(SA, c(34.712080120418108, 34.891723808488869, 35.026202257609505,
                   34.847160842234572, 34.736398269039945, 34.732228881079742))



