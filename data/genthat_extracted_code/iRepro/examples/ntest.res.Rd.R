library(iRepro)


### Name: ntest.res
### Title: Normality Check for Interval-Censored Data with Repeated
###   Measurements - Residuals
### Aliases: ntest.res print.ntestRes

### ** Examples

# Example with 6 predefined classes (grouped data)
classes <- 1:6
class.limits <- cbind(classes-0.5,classes+0.5)
r1 <- sample(classes,30,replace=TRUE)
r2 <- sample(classes,30,replace=TRUE)
ntest.res(r1,r2,predefined.classes=TRUE,classes,class.limits,bins=10)



