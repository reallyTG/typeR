library(PCDimension)


### Name: AuerGervini-class
### Title: Estimating Number of Principal Components Using the Auer-Gervini
###   Method
### Aliases: PCDimension AuerGervini-class plot,AuerGervini,missing-method
###   summary,AuerGervini-method AuerGervini agDimension
### Keywords: classes models

### ** Examples

showClass("AuerGervini")
# simulate variances
lambda <- rev(sort(diff(sort(c(0, 1, runif(9))))))
# apply the Auer-Gervini method
ag <- AuerGervini(lambda, dd=c(3,10))
# Review the results
summary(ag)
agDimension(ag)
agDimension(ag, agDimKmeans)
# Look at the results graphically
plot(ag, agfun=list(agDimTwiceMean, agDimKmeans))



