library(BMA)


### Name: plot.bicreg
### Title: Plots the posterior distributions of coefficients derived from
###   Bayesian model averaging
### Aliases: plot.bicreg plot.bic.glm plot.bic.surv plot
### Keywords: regression models

### ** Examples

library(MASS)
data(UScrime)
x<- UScrime[,-16]
y<- log(UScrime[,16])
x[,-2]<- log(x[,-2])
plot( bicreg(x, y)) 



