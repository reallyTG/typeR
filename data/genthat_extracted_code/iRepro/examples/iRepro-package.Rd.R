library(iRepro)


### Name: iRepro-package
### Title: Reproducibility for Interval-Censored Data
### Aliases: iRepro-package iRepro

### ** Examples

# Data generation (grouped data)
classes <- 1:6
class.limits <- cbind(classes-0.5,classes+0.5)
r1 <- sample(classes,100,replace=TRUE) # first measurement
r2 <- sample(classes,100,replace=TRUE) # second measurement

summary(intervalICC(r1,r2,predefined.classes=TRUE,classes,class.limits)) # ICC estimation



