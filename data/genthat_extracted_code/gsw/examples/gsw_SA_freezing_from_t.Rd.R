library(gsw)


### Name: gsw_SA_freezing_from_t
### Title: Compute Absolute Salinity at Freezing in-situ Temperature
### Aliases: gsw_SA_freezing_from_t

### ** Examples

t <- c(-0.11901, -0.15608, -0.72138, -1.97738, -2.31728, -2.56764)
p <- c(      10,       50,      125,      250,      600,     1000)
saturation_fraction <- 1
SA <- gsw_SA_freezing_from_t(t, p, saturation_fraction)
expect_equal(SA, c(2.015798440008186, 2.150742019102164, 11.679080083422074,
                 32.844196564019278, 34.138949682974413, 33.100945437175568))



