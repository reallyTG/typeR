library(gsw)


### Name: gsw_specvol_second_derivatives_wrt_enthalpy
### Title: Second Derivatives of Specific Volume wrt Enthalpy
### Aliases: gsw_specvol_second_derivatives_wrt_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_specvol_second_derivatives_wrt_enthalpy(SA, CT, p)
expect_equal(r$specvol_SA_SA/1e-8, c(0.080900028996264, 0.080937999675000, 0.084663065647101,
                                   0.096973364985384, 0.099727453432293, 0.101353037979356))
expect_equal(r$specvol_SA_h/1e-12, c(0.325437133570796, 0.327060462851431, 0.375273569184178,
                                   0.545188833073084, 0.589424881889351, 0.616101548209175))
expect_equal(r$specvol_h_h/1e-15, c(0.447949998681476, 0.449121446914278, 0.485998151346315,
                                  0.598480711660961, 0.628708349875318, 0.647433212216398))



