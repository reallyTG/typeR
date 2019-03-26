library(asbio)


### Name: partial.R2
### Title: Partial correlations of determination in multiple regression
### Aliases: partial.R2

### ** Examples

Soil.C<-c(13,20,10,11,2,25,30,25,23)
Soil.N<-c(1.2,2,1.5,1,0.3,2,3,2.7,2.5)
Slope<-c(15,14,16,12,10,18,25,24,20)
Aspect<-c(45,120,100,56,5,20,5,15,15)
Y<-as.vector(c(20,30,10,15,5,45,60,55,45))

lm.with<-lm(Y~Soil.C+Soil.N+Slope+Aspect)
lm.without<-update(lm.with, ~. - Soil.N)

partial.R2(lm.without,lm.with)



