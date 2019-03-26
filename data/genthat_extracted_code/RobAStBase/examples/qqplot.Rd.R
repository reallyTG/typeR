library(RobAStBase)


### Name: qqplot
### Title: Methods for Function qqplot in Package 'RobAStBase'
### Aliases: qqplot qqplot-methods qqplot,ANY,RobModel-method
###   qqplot,ANY,InfRobModel-method qqplot,ANY,kStepEstimate-method
### Keywords: hplot distribution

### ** Examples

## \donttest to reduce check time
## No test: 
qqplot(rnorm(40, mean = 15, sd = sqrt(30)), Chisq(df=15))
RobM <- InfRobModel(center = NormLocationFamily(mean=13,sd=sqrt(28)),
                    neighbor = ContNeighborhood(radius = 0.4))

x <- rnorm(20, mean = 15, sd = sqrt(30))
qqplot(x, RobM)
qqplot(x, RobM, alpha.CI=0.9, add.points.CI=FALSE)
## End(No test)
## further examples for ANY,kStepEstimator-method
## in example to roptest() in package ROptEst



