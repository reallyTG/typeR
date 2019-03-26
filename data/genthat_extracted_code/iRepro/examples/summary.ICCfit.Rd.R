library(iRepro)


### Name: summary.ICCfit
### Title: Summary for ICCfit Objects
### Aliases: summary.ICCfit print.summary.ICCfit

### ** Examples

# Example with 6 predefined classes (grouped data)
classes <- 1:6
class.limits <- cbind(classes-0.5,classes+0.5)
r1 <- sample(classes,30,replace=TRUE)
r2 <- sample(classes,30,replace=TRUE)
icc.est <- intervalICC(r1,r2,predefined.classes=TRUE,classes,class.limits)
summary(icc.est)



