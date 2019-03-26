library(gsw)


### Name: gsw_CT_from_enthalpy
### Title: Conservative Temperature from Enthalpy
### Aliases: gsw_CT_from_enthalpy

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
h <- c(1.15103e5, 1.14014e5, 0.92180e5, 0.43255e5, 0.33087e5, 0.26970e5)
p <- c(       10,        50,       125,       250,       600,      1000)
pt <- c(28.7832, 28.4209, 22.7850, 10.2305,  6.8292,  4.3245)
CT <- gsw_CT_from_enthalpy(SA, h, p)
expect_equal(CT, c(28.809854569021972, 28.439026483379287, 22.786196534098817,
  10.226106994920777, 6.827159682675204, 4.323428660306681))



