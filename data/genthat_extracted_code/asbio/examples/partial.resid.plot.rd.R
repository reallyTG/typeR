library(asbio)


### Name: partial.resid.plot
### Title: Partial residual plots for interpretation of multiple
###   regression.
### Aliases: partial.resid.plot
### Keywords: univar graphs

### ** Examples

Soil.C<-c(13,20,10,11,2,25,30,25,23)
Soil.N<-c(1.2,2,1.5,1,0.3,2,3,2.7,2.5)
Slope<-c(15,14,16,12,10,18,25,24,20)
Aspect<-c(45,120,100,56,5,20,5,15,15)
Y<-c(20,30,10,15,5,45,60,55,45)
x <- lm(Y ~ Soil.N + Soil.C + Slope + Aspect)
op <- par(mfrow=c(2,2),mar=c(5,4,1,1.5))
partial.resid.plot(x)
par(op)



