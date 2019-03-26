library(polySegratioMM)


### Name: readJags
### Title: Read MCMC sample(s) from a JAGS run
### Aliases: readJags segratioMCMC
### Keywords: manip

### ** Examples


library(polySegratio)

## simulate small autooctaploid data set
a1 <- sim.autoMarkers(8,c(0.7,0.2,0.1),n.markers=100,n.individuals=50)
##print(a1)
sr <-  segregationRatios(a1$markers)
x <- setModel(3,8)
x2 <- setPriors(x)
cat(x$bugs.code,x2$bugs.code,sep="\n")


x3 <- setModel(3,8, random.effect = TRUE)
x4 <- setPriors(x3, type="strong")

dumpData(sr, x3)
inits <- setInits(x,x2)
dumpInits(inits)
##x.priors <- setPriors(x, "vague")
writeJagsFile(x, x2, stem="test")

small <- setControl(x, burn.in=20, sample=50)
writeControlFile(small)
## Not run: 
##D rj <- runJags(small)  ## just run it
##D 
##D xj <- readJags(rj)
##D print(xj)
## End(Not run)



