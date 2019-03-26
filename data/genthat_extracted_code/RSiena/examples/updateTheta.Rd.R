library(RSiena)


### Name: updateTheta
### Title: A function to update the initial values of theta, and a function
###   to update an effects object.
### Aliases: updateTheta updateSpecification
### Keywords: models

### ** Examples

## For updateTheta:
mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
mydata <- sienaDataCreate(mynet1)
myeff1 <- getEffects(mydata)
myeff1 <- includeEffects(myeff1, transTrip)
myalgorithm <- sienaAlgorithmCreate(nsub=1, n3=100)
ans <- siena07(myalgorithm, data=mydata, effects=myeff1, batch=TRUE)
ans$theta
(myeff <- updateTheta(myeff1, ans))
##
## For updateSpecification:
myeff2 <- getEffects(mydata)
myeff2 <- includeEffects(myeff2, inPop)
updateSpecification(myeff2, myeff1)
# Create (meaningless) two-dimensional dependent network
mynet1 <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)))
mynet2 <- sienaDependent(array(c(s503, s501), dim=c(50, 50, 2)))
mydata12 <- sienaDataCreate(mynet1, mynet2)
myeff12 <- getEffects(mydata12)
myeff.new <- getEffects(mydata12)
(myeff12 <- includeEffects(myeff12, inPop, outPop, outAct))
# update myeff.new only for mynet1:
updateSpecification(myeff.new, myeff12)
# update myeff.new for all dependent networks:
(myeff.updated <- updateSpecification(myeff.new, myeff12, "all"))
# use multivariate effects object to update univariate effects object:
myeff1 <- getEffects(sienaDataCreate(mynet1))
updateSpecification(myeff1, myeff.updated)



