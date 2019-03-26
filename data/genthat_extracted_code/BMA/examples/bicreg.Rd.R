library(BMA)


### Name: bicreg
### Title: Bayesian Model Averaging for linear regression models.
### Aliases: bicreg
### Keywords: regression models

### ** Examples

library(MASS)
data(UScrime)
x<- UScrime[,-16]
y<- log(UScrime[,16])
x[,-2]<- log(x[,-2])
lma<- bicreg(x, y, strict = FALSE, OR = 20) 
summary(lma)
plot(lma)

imageplot.bma(lma)




