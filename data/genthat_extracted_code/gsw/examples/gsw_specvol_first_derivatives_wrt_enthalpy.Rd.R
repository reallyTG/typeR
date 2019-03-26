library(gsw)


### Name: gsw_specvol_first_derivatives_wrt_enthalpy
### Title: First Derivatives of Specific Volume wrt Enthalpy
### Aliases: gsw_specvol_first_derivatives_wrt_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_specvol_first_derivatives_wrt_enthalpy(SA, CT, p)
expect_equal(r$v_SA_wrt_h/1e-6, c(-0.702143511679586, -0.701991101310494, -0.708834353735310,
                                -0.730130919555592, -0.733018321892082, -0.733342002723321))
expect_equal(r$v_h/1e-10, c(0.795862623587769, 0.790648383268264, 0.687443468257647,
                          0.422105846942233, 0.355778874334799, 0.314053366403993))



