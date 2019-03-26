library(RobAStBase)


### Name: returnlevelplot
### Title: Methods for Function returnlevelplot in Package 'RobAStBase'
### Aliases: returnlevelplot returnlevelplot-methods
###   returnlevelplot,ANY,RobModel-method
###   returnlevelplot,ANY,InfRobModel-method
###   returnlevelplot,ANY,kStepEstimate-method
### Keywords: hplot distribution

### ** Examples

returnlevelplot(rnorm(40, mean = 15, sd = sqrt(30)), Chisq(df=15))
RobM <- InfRobModel(center = NormLocationFamily(mean=13,sd=sqrt(28)),
                    neighbor = ContNeighborhood(radius = 0.4))
## No test: 
## \donttest to reduce check time
x <- rnorm(20, mean = 15, sd = sqrt(30))
returnlevelplot(x, RobM)
returnlevelplot(x, RobM, alpha.CI=0.9, add.points.CI=FALSE)
## End(No test)
## further examples for ANY,kStepEstimator-method
## in example to roptest() in package ROptEst



