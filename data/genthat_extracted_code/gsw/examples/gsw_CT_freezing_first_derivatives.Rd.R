library(gsw)


### Name: gsw_CT_freezing_first_derivatives
### Title: First Derivatives of Conservative Temperature for Freezing Water
### Aliases: gsw_CT_freezing_first_derivatives

### ** Examples

SA <- c(                 34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(                       10,      50,     125,     250,     600,    1000)
saturation_fraction <- c(      1,     0.8,     0.6,     0.5,     0.4,       0)
r <- gsw_CT_freezing_first_derivatives(SA, p, saturation_fraction)
expect_equal(r$CTfreezing_SA, c(-0.058193253897272, -0.058265158334170, -0.058345661671901,
                              -0.058373842446463, -0.058534544740846, -0.058730846361252))
expect_equal(r$CTfreezing_p/1e-7, c(-0.765300390432684, -0.766942996466485, -0.769892679988284,
                                  -0.774561011527902, -0.787769143040504, -0.802771548245855))



