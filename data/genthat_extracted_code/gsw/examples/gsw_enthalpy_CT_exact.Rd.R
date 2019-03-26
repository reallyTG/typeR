library(gsw)


### Name: gsw_enthalpy_CT_exact
### Title: Seawater Specific Enthalpy in terms of Conservative Temperature
### Aliases: gsw_enthalpy_CT_exact

### ** Examples

SA <- c(34.7118, 34.8915, 35.0256, 34.8472, 34.7366, 34.7324)
CT <- c(28.8099, 28.4392, 22.7862, 10.2262,  6.8272,  4.3236)
p <- c(      10,      50,     125,     250,     600,    1000)
e <- gsw_enthalpy_CT_exact(SA, CT, p)
expect_equal(e/1e5, c(1.151031813321767, 1.140146925586514, 0.921800131787836,
                    0.432553712315790, 0.330871615358722, 0.269706848807403))



