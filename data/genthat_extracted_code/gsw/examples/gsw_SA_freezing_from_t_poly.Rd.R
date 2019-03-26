library(gsw)


### Name: gsw_SA_freezing_from_t_poly
### Title: Compute Absolute Salinity at Freezing in-situ Temperature
###   (Polynomial version)
### Aliases: gsw_SA_freezing_from_t_poly

### ** Examples

t <- c(-0.11901, -0.15608, -0.72138, -1.97738, -2.31728, -2.56764)
p <- c(      10,       50,      125,      250,      600,     1000)
saturation_fraction <- 1
SA <- gsw_SA_freezing_from_t_poly(t, p, saturation_fraction)
expect_equal(SA, c(2.017072489768256, 2.151989342038462, 11.677649626115608,
                 32.843128114999026, 34.136459306273451, 33.097427522625182))



