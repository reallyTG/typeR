library(shallot)


### Name: nsubsets
### Title: Number of Subsets
### Aliases: nsubsets.random nsubsets.probability nsubsets.average
###   nsubsets.variance

### ** Examples

## No test: 
pd <- ewens.pitman.attraction(
        mass(1),
        discount(0.05),
        attraction(permutation(n.items=50,fixed=FALSE),
          decay.exponential(temperature(1.0),dist(scale(USArrests)))))
mean(nsubsets.random(pd,1000))
nsubsets.average(pd)

pde <- ewens(mass(1),50)
nsubsets.variance(pde)
nsubsets.probability(pde,4)
## Don't show: 
rscala::scalaDisconnect(shallot:::s)
## End(Don't show)
## End(No test)



