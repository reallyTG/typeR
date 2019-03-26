library(car)


### Name: hccm
### Title: Heteroscedasticity-Corrected Covariance Matrices
### Aliases: hccm hccm.lm hccm.default
### Keywords: regression

### ** Examples

options(digits=4)
mod<-lm(interlocks~assets+nation, data=Ornstein)
vcov(mod)
##             (Intercept)     assets  nationOTH   nationUK   nationUS
## (Intercept)   1.079e+00 -1.588e-05 -1.037e+00 -1.057e+00 -1.032e+00
## assets       -1.588e-05  1.642e-09  1.155e-05  1.362e-05  1.109e-05
## nationOTH    -1.037e+00  1.155e-05  7.019e+00  1.021e+00  1.003e+00
## nationUK     -1.057e+00  1.362e-05  1.021e+00  7.405e+00  1.017e+00
## nationUS     -1.032e+00  1.109e-05  1.003e+00  1.017e+00  2.128e+00
hccm(mod)             
##             (Intercept)     assets  nationOTH   nationUK   nationUS
## (Intercept)   1.664e+00 -3.957e-05 -1.569e+00 -1.611e+00 -1.572e+00
## assets       -3.957e-05  6.752e-09  2.275e-05  3.051e-05  2.231e-05
## nationOTH    -1.569e+00  2.275e-05  8.209e+00  1.539e+00  1.520e+00
## nationUK     -1.611e+00  3.051e-05  1.539e+00  4.476e+00  1.543e+00
## nationUS     -1.572e+00  2.231e-05  1.520e+00  1.543e+00  1.946e+00



