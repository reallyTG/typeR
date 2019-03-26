library(gsw)


### Name: gsw_t_freezing_first_derivatives
### Title: Derivatives of Freezing Water Properties
### Aliases: gsw_t_freezing_first_derivatives

### ** Examples

SA <- c(               34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(                     10,      50,     125,     250,     600,    1000)
saturation_fraction <- c(    1,     0.8,     0.6,     0.5,     0.4,       0)
derivs <- gsw_t_freezing_first_derivatives(SA, p, saturation_fraction)
expect_equal(derivs$tfreezing_SA, c(-0.056811800705787, -0.056856999671114, -0.056903079789292,
                                  -0.056904020028541, -0.056974588411844, -0.057082363270642))
expect_equal(derivs$tfreezing_p/1e-7, c(-0.748468312442338, -0.749793159537290, -0.752225023995510,
                                      -0.756170965034610, -0.767279572670040, -0.779936552091913))



