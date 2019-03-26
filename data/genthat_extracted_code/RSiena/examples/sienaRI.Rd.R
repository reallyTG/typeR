library(RSiena)


### Name: sienaRI
### Title: Functions to assess the relative importance of effects at
###   observation moments
### Aliases: sienaRI entropy plot.sienaRI print.sienaRI sienaRI.methods
### Keywords: models

### ** Examples

myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=50)
mynet1 <- sienaDependent(array(c(tmp3, tmp4), dim=c(32, 32, 2)))
mydata <- sienaDataCreate(mynet1)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, density, recip, transTies, nbrDist2)
ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE)

RI <- sienaRI(mydata, ans)
RI
## Not run: 
##D plot(RI, addPieChart=TRUE)
##D plot(RI, actors=1:20, addPieChart=TRUE, radius=1.08)
## End(Not run)

myalgorithm <- sienaAlgorithmCreate(nsub=2, n3=50)
mynet2 <- sienaDependent(array(c(s502, s503), dim=c(50, 50, 2)))
mybeh <- sienaDependent(s50a[,2:3], type="behavior")
mydata2 <- sienaDataCreate(mynet2, mybeh)
myeff2 <- getEffects(mydata2)
myeff2 <- includeEffects(myeff2, density, recip, transTies)
ans2 <- siena07(myalgorithm, data=mydata2, effects=myeff2, batch=TRUE)
# Use only the parameters for the evaluation function:
theta.eval <- ans2$theta[myeff2$type[myeff2$include]=="eval"]
RI <- sienaRI(mydata2, theta=theta.eval, algorithm=myalgorithm,
              effects = myeff2)
RI
## Not run: 
##D plot(RI[[2]], col = c("red", "green"), legend=FALSE)
##D plot(RI[[1]], addPieChart = TRUE, legendColumns=2)
## End(Not run)



