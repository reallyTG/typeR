library(PCDimension)


### Name: agDimFunction
### Title: Divide Steps into "Long" and "Short" to Compute Auer-Gervini
###   Dimension
### Aliases: agDimFunction agDimTwiceMean agDimKmeans agDimKmeans3
###   agDimSpectral agDimTtest agDimTtest2 agDimCPT makeAgCpmFun
### Keywords: models

### ** Examples

# simulate variances
lambda <- rev(sort(diff(sort(c(0, 1, runif(9))))))
# apply the Auer-Gervini method
ag <- AuerGervini(lambda, dd=c(3,10))
# Review the results
summary(ag)
agDimension(ag)
agDimension(ag, agDimKmeans)
agDimension(ag, agDimSpectral)
f <- makeAgCpmFun("Exponential")
agDimension(ag, f)



