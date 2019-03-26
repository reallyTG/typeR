library(gsw)


### Name: gsw_rho_first_derivatives_wrt_enthalpy
### Title: Density First Derivatives wrt enthalpy (75-term equation)
### Aliases: gsw_rho_first_derivatives_wrt_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_rho_first_derivatives_wrt_enthalpy(SA, CT, p)
expect_equal(r$rho_SA_wrt_h, c(0.733147960400929, 0.733595114830609, 0.743886977148835,
                              0.771275693831993, 0.777414200397148, 0.781030546357425))
expect_equal(r$rho_h*1e4, c(-0.831005413475887, -0.826243794873652, -0.721438289309903,
                          -0.445892608094272, -0.377326924646647, -0.334475962698187))



