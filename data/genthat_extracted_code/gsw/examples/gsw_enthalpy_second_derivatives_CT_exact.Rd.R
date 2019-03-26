library(gsw)


### Name: gsw_enthalpy_second_derivatives_CT_exact
### Title: Second Derivatives of Enthalpy (exact)
### Aliases: gsw_enthalpy_second_derivatives_CT_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <- c(      10,      50,     125,     250,     600,    1000)
r <- gsw_enthalpy_second_derivatives_CT_exact(SA, CT, p)
expect_equal(r$h_SA_SA, c(0.000082767011576, 0.000414469343141, 0.001089580017293,
                        0.002472193425998, 0.006103171596320, 0.010377465312463))
expect_equal(r$h_SA_CT, c(0.000130320164426, 0.000655016236924, 0.001879127443985,
                        0.005468695168037, 0.014315709000526, 0.025192691262061))
expect_equal(r$h_CT_CT, c(0.000714365642428, 0.003584965089168, 0.009733337653703,
                        0.024044402143825, 0.061449390733344, 0.107333638394904))



