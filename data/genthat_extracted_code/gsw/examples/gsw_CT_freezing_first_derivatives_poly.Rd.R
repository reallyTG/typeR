library(gsw)


### Name: gsw_CT_freezing_first_derivatives_poly
### Title: First Derivatives of Conservative Temperature for Freezing Water
###   (Polynomial version)
### Aliases: gsw_CT_freezing_first_derivatives_poly

### ** Examples

SA <- c(                 34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(                       10,      50,     125,     250,     600,    1000)
saturation_fraction <- c(      1,     0.8,     0.6,     0.5,     0.4,       0)
r <- gsw_CT_freezing_first_derivatives_poly(SA, p, saturation_fraction)
expect_equal(r$CTfreezing_SA, c(-0.058191181082769, -0.058263310660779, -0.058343573188907,
                              -0.058370514075271, -0.058528023214462, -0.058722959729433))
expect_equal(r$CTfreezing_p/1e-7, c(-0.765690732336706, -0.767310677213890, -0.770224214219328,
                                  -0.774843488962665, -0.787930403016584, -0.802821704643775))



