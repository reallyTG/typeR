library(polySegratioMM)


### Name: calculateDIC
### Title: Compute DIC for fitted mixture model
### Aliases: calculateDIC
### Keywords: manip

### ** Examples

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)

## compute segregation ratios
sr <-  segregationRatios(a1$markers)

## set up model, priors, inits etc and write files for JAGS
x <- setModel(3,8)
x2 <- setPriors(x)
dumpData(sr, x)
inits <- setInits(x,x2)
dumpInits(inits)
writeJagsFile(x, x2, stem="test")

## Not run: 
##D ## run JAGS
##D small <- setControl(x, burn.in=200, sample=500)
##D writeControlFile(small)
##D rj <- runJags(small)  ## just run it
##D print(rj)
##D 
##D ## read mcmc chains and print DIC
##D xj <- readJags(rj)
##D print(calculateDIC(xj, x, x2, sr))
## End(Not run)



