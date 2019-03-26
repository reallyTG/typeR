library(shallot)


### Name: shallot-package
### Title: Random Partition Distribution Indexed by Pairwise Information
### Aliases: shallot-package shallot
### Keywords: package

### ** Examples

## No test: 
data <- iris[,-ncol(iris)]
truth <- as.integer(iris[,ncol(iris)])
distance <- as.dist(as.matrix(dist(scale(data))+0.001))

decay <- decay.exponential(temperature(9.0, fixed=TRUE), distance)
permutation <- permutation(n.items=nrow(data), fixed = FALSE)
attraction <- attraction(permutation, decay)
mass <- mass(1.0, fixed = TRUE)
discount <- discount(0.2, fixed = TRUE)
distribution <- ewens.pitman.attraction(mass, discount, attraction)

raw <- sample.partitions(distribution, 500, parallel=FALSE)
samples <- process.samples(raw)

library(sdols)
pp <- expectedPairwiseAllocationMatrix(samples$labels)
est <- salso(pp)
conf <- confidence(est,pp)
plot(conf)
plot(conf,data=data)

## Don't show: 
rscala::scalaDisconnect(shallot:::s)
## End(Don't show)
## End(No test)



