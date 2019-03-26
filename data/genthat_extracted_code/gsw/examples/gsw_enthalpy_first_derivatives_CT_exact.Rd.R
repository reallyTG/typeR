library(gsw)


### Name: gsw_enthalpy_first_derivatives_CT_exact
### Title: First Derivatives of Enthalpy wrt CT
### Aliases: gsw_enthalpy_first_derivatives_CT_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.7856, 28.4329, 22.8103, 10.2600,  6.8863,  4.4036)
p <-  c(     10,      50,     125,     250,     600,    1000)
d <- gsw_enthalpy_first_derivatives_CT_exact(SA, CT, p)
expect_equal(d$h_SA, c(-0.070224183838619, -0.351159869043798, -0.887036550157504,
                     -1.829626251448858, -4.423522691827955, -7.405211691293971))
expect_equal(d$h_CT/1e3, c(3.991899712269790, 3.992025674159605, 3.992210402650973,
                         3.992283991748418, 3.992685275917238, 3.993014370250710))



