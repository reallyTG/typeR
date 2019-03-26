library(RSiena)


### Name: sienaAlgorithmCreate
### Title: Function to create an object containing the algorithm
###   specifications for parameter estimation in RSiena
### Aliases: sienaModelCreate sienaAlgorithmCreate sienaModel
###   sienaAlgorithm model.create
### Keywords: classes

### ** Examples

myAlgorithm <- sienaAlgorithmCreate(projname="NetworkDyn")
StdAlgorithm <- sienaAlgorithmCreate(projname="NetworkDyn", useStdInits=TRUE)
CondAlgorithm <- sienaAlgorithmCreate(projname="NetworkDyn", condvarno=1, cond=TRUE)
Max10Algorithm <- sienaAlgorithmCreate(projname="NetworkDyn", MaxDegree=c(mynet=10),
     behModelType=c(mynet=1))
Beh2Algorithm <- sienaAlgorithmCreate(projname="NetBehDyn", behModelType=c(mybeh=2))
# where mynet is the name of the network object created by sienaDependent(),
# and mybeh the name of the behavior object created by the same function.



