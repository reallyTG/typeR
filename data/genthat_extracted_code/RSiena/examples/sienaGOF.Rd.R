library(RSiena)


### Name: sienaGOF
### Title: Functions to assess goodness of fit for SAOMs
### Aliases: sienaGOF plot.sienaGOF descriptives.sienaGOF
### Keywords: models

### ** Examples

mynet <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)))
mybeh <- sienaDependent(s50a[,1:2], type="behavior")
mydata <- sienaDataCreate(mynet, mybeh)
myeff <- getEffects(mydata)
myeff <- includeEffects(myeff, transTrip)
myeff <- setEffect(myeff, cycle3, fix=TRUE, test=TRUE)
myeff <- setEffect(myeff, transTies, fix=TRUE, test=TRUE)
myalgorithm <- sienaAlgorithmCreate(nsub=1, n3=50)
# Shorter phases 2 and 3, just for example.
ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE, returnDeps=TRUE)
gofi <- sienaGOF(ans, IndegreeDistribution, verbose=TRUE, join=TRUE,
  varName="mynet")
summary(gofi)
plot(gofi)

## Not run: 
##D # Illustration just for showing a case with two dependent networks;
##D # running time backwards is not meaningful!
##D mynet1 <- sienaDependent(array(c(s501, s502), dim=c(50, 50, 2)))
##D mynet2 <- sienaDependent(array(c(s503, s501), dim=c(50, 50, 2)))
##D mybeh <- sienaDependent(s50a[,1:2], type="behavior")
##D mydata <- sienaDataCreate(mynet1, mynet2, mybeh)
##D myeff <- getEffects(mydata)
##D myeff <- includeEffects(myeff, transTrip)
##D myeff <- includeEffects(myeff, recip, name="mynet2")
##D myeff <- setEffect(myeff, cycle3, fix=TRUE, test=TRUE)
##D myeff <- setEffect(myeff, transTies, fix=TRUE, test=TRUE)
##D myalgorithm <- sienaAlgorithmCreate(nsub=1, n3=50)
##D # Shorter phases 2 and 3, just for example.
##D ans <- siena07(myalgorithm, data=mydata, effects=myeff, batch=TRUE, returnDeps=TRUE)
##D gofi <- sienaGOF(ans, IndegreeDistribution, verbose=TRUE, join=TRUE,
##D   varName="mynet1")
##D summary(gofi)
##D plot(gofi)
## End(Not run)

## Not run: 
##D (gofi.nc <- sienaGOF(ans, IndegreeDistribution, cumulative=FALSE,
##D     varName="mynet1"))
##D # cumulative is an example of "...".
##D plot(gofi.nc)
##D descriptives.sienaGOF(gofi.nc)
##D 
##D (gofi2 <- sienaGOF(ans, IndegreeDistribution, varName="mynet2"))
##D plot(gofi2)
##D 
##D (gofb <- sienaGOF(ans, BehaviorDistribution, varName = "mybeh"))
##D plot(gofb)
##D 
##D (gofo <- sienaGOF(ans, OutdegreeDistribution, varName="mynet1",
##D     levls=0:6, cumulative=FALSE))
##D # levls is another example of "...".
##D plot(gofo)
## End(Not run)

## A demonstration of using multiple processes
## Not run: 
##D library(parallel)
##D (n.clus <- detectCores() - 1) # subtract 1 to keep time for other processes
##D myalgorithm.c <- sienaAlgorithmCreate(nsub=4, n3=1000, seed=12345)
##D (ans.c <- siena07(myalgorithm.c, data=mydata, effects=myeff, batch=TRUE,
##D     returnDeps=TRUE, useCluster=TRUE, nbrNodes=n.clus))
##D gofi.1 <- sienaGOF(ans.c, IndegreeDistribution, verbose=TRUE,
##D   varName="mynet1")
##D cl <- makeCluster(n.clus)
##D gofi.cl <- sienaGOF(ans.c, IndegreeDistribution, varName="mynet1",
##D   cluster=cl)
##D # compare simulation times
##D attr(gofi.1,"simTime")
##D attr(gofi.cl,"simTime")
## End(Not run)




