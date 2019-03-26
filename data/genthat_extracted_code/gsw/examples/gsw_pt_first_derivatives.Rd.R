library(gsw)


### Name: gsw_pt_first_derivatives
### Title: First Derivatives of Potential Temperature
### Aliases: gsw_pt_first_derivatives

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
r <- gsw_pt_first_derivatives(SA, CT)
expect_equal(r$pt_SA, c(0.041863223165431, 0.041452303483011, 0.034682095247246,
                      0.018711079068408, 0.014079958329844, 0.010577326129948))
expect_equal(r$pt_CT, c(0.997192967140242, 0.997451686508335, 0.998357568277750,
                      0.999996224076267, 1.000283719083268, 1.000525947028218))



