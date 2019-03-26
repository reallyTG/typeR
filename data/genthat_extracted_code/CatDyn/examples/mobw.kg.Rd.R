library(CatDyn)


### Name: mobw.kg
### Title: Mean body weight per month
### Aliases: mobw.kg
### Keywords: ~models

### ** Examples

data(gayhakelm)
data(gayhakelw)
par <-  c(4e-4,2.9)
method <- "SANN"
span   <- 1
chihake.mobw <- mobw.kg(par=par, lenw=gayhakelw, lenm=gayhakelm,
                        method=method, span=span)



