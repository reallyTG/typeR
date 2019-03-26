library(drc)


### Name: methionine
### Title: Weight gain for different methionine sources
### Aliases: methionine
### Keywords: datasets

### ** Examples


## Fitting model with constraint on one parameter 
met.ar.m1 <- drm(gain~dose, product, data = methionine, 
fct = AR.3(), pmodels = list(~1, ~factor(product), ~factor(product)), 
upperl = c(Inf, Inf, 1700, Inf, Inf)) 

plot(met.ar.m1, xlim=c(0,0.3), ylim=c(1450, 1800))
abline(h=1700, lty=1)

summary(met.ar.m1)




