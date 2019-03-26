library(SSN)


### Name: createSSN
### Title: Create an SpatialStreamnetwork Object
### Aliases: createSSN igraphKamadaKawai iterativeTreeLayout

### ** Examples


library(SSN)
#Simulate three networks, the first consisting of ten straight line segments,
#the second of 20 and the third of 30. There are two observed points on the first
#network, four on the second and six on the third. All the observed points are
#distributed uniformly. The default for prediction points is no prediction points.
ssn1 <- createSSN(c(10, 20, 30), obsDesign = binomialDesign(c(2,4,6)),
  path=paste(tempdir(),"/simulated1.ssn", sep = ""), importToR = TRUE)
#NOT RUN plot(ssn1)

#Same as above, but using iterativeTreeLayout
#set.seed(5)
#ssn2 <- createSSN(c(10, 20, 30), obsDesign = binomialDesign(c(2,4,6)),
#  path=paste(tempdir(),"/simulated2.ssn", sep = ""), importToR = TRUE, 
#  treeFunction = iterativeTreeLayout)
#NOT RUN plot(ssn2)

#Simulate the same number of line segments per network, but this time the observed
#points have the distribution of a Poisson process with rates 2, 1 and 0.5
#respectively. Again there are no prediction points.
#ssn3 <- createSSN(c(10, 20, 30), obsDesign = poissonDesign(c(2,1,0.5)),
#  path=paste(tempdir(),"/simulated3.ssn", sep = ""), importToR = TRUE)
#NOT RUN plot(ssn3)

#Simulate the same number of line segments per network, but this time the observed
#points have a hard-core process distribution. Two hundred points are placed on
#every network according to the binomial process, and then points are removed
#until every poir of points is at least a distance 0.5 apart on the first network,
#0.25 on the second and 0.1 on the third. Again there are no prediction points.
#ssn4 <- createSSN(c(10, 20, 30), obsDesign = hardCoreDesign(200, c(0.5, 0.25, 0.1)),
#  path=paste(tempdir(),"/simulated4.ssn", sep = ""), importToR = TRUE)
#NOT RUN plot(ssn4)

#This time there are the same number of observed points on each of the networks,
#but there are ten prediction sites on each network.
ssn5 <- createSSN(c(10, 20, 30), obsDesign = binomialDesign(c(2, 4, 6)),
  predDesign = binomialDesign(c(10, 10, 10)), 
  path=paste(tempdir(),"/simulated5.ssn", sep = ""),
  importToR = TRUE)
#NOT RUN plot(ssn5)

#This time the observed and prediction points are a regular grid, spacing 0.5
#ssn6 <- createSSN(c(10, 20, 30), obsDesign = systematicDesign(0.5),
#  predDesign = systematicDesign(0.5), 
#  path=paste(tempdir(),"/simulated6.ssn", sep = ""),
#  importToR = TRUE)
#NOT RUN plot(ssn6)

#Same as example number 5, but this time the observed (but not predicted) points
#are replicated twice with different time values
#ssn7 <- createSSN(c(10, 20, 30), obsDesign = binomialDesign(c(2, 4, 6), 
#  replications=2),
#  predDesign = binomialDesign(c(10, 10, 10)), 
#	path=paste(tempdir(),"/simulated7.ssn", sep = ""),
#  importToR = TRUE)
#NOT RUN plot(ssn7)

ssn1@obspoints@SSNPoints[[1]]@point.data
ssn5@obspoints@SSNPoints[[1]]@point.data




