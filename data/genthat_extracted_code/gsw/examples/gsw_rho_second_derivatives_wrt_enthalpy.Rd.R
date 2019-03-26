library(gsw)


### Name: gsw_rho_second_derivatives_wrt_enthalpy
### Title: Second Derivatives of Density wrt Enthalpy
### Aliases: gsw_rho_second_derivatives_wrt_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_rho_second_derivatives_wrt_enthalpy(SA, CT, p)
expect_equal(r$rho_SA_SA/1e-3, c(0.207312267114544, 0.207065033523473, 0.191848346945039,
                               0.133182862881598, 0.116049034622904, 0.102745309429078))
expect_equal(r$rho_SA_h/1e-6, c(-0.459053080088382, -0.460370569872258, -0.498605615416296,
                              -0.642833108550133, -0.682091962941161, -0.706793055445909))
expect_equal(r$rho_h_h/1e-9, c(-0.454213854637790, -0.455984900239309, -0.499870030989387,
                             -0.628337767293403, -0.664021595759308, -0.687367088752173))



