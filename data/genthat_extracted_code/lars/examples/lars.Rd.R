library(lars)


### Name: lars
### Title: Fits Least Angle Regression, Lasso and Infinitesimal Forward
###   Stagewise regression models
### Aliases: lars
### Keywords: regression

### ** Examples

data(diabetes)
par(mfrow=c(2,2))
attach(diabetes)
object <- lars(x,y)
plot(object)
object2 <- lars(x,y,type="lar")
plot(object2)
object3 <- lars(x,y,type="for") # Can use abbreviations
plot(object3)
detach(diabetes)



