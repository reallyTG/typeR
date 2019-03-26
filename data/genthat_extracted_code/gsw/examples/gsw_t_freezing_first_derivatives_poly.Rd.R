library(gsw)


### Name: gsw_t_freezing_first_derivatives_poly
### Title: Derivatives of Freezing Water Properties (Polynomial version)
### Aliases: gsw_t_freezing_first_derivatives_poly

### ** Examples

SA <- c(               34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
p <- c(                     10,      50,     125,     250,     600,    1000)
saturation_fraction <- c(    1,     0.8,     0.6,     0.5,     0.4,       0)
derivs <- gsw_t_freezing_first_derivatives_poly(SA, p, saturation_fraction)
expect_equal(derivs$tfreezing_SA, c(-0.056810211094078, -0.056855567524973, -0.056901968693345,
                                  -0.056903498206432, -0.056975157476629, -0.057083526206200))
expect_equal(derivs$tfreezing_p/1e-7, c(-0.748987354878138, -0.750288853857513, -0.752676389629787,
                                      -0.756549680608529, -0.767482625710990, -0.779985619685683))



