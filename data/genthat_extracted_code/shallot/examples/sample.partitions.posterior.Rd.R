library(shallot)


### Name: sample.partitions.posterior
### Title: Sample Partitions from Posterior Distribution of Partition
### Aliases: sample.partitions.posterior

### ** Examples

1+2
#\donttest{
#mass <- mass(1.0, fixed=TRUE)
#discount <- discount(0.05, fixed=TRUE)
#distance <- dist(scale(USArrests[1:9,]))
#if ( min(distance[upper.tri(distance)],na.rm=TRUE) == 0 )
#  stop("Oops, distances must be strictly positive.")
#
#n.items <- attr(distance,"Size")
#permutation <- permutation(n.items=n.items, fixed=FALSE)
#temperature <- temperature(2,fixed=TRUE)
#attraction <- attraction(permutation,decay.exponential(temperature,distance))
#partition.distribution <- ewens.pitman.attraction(mass, discount, attraction)
#
### Model inputs.
#data <- c(-1.48, -1.40, -1.16, -1.08, -1.02, 0.14, 0.51, 0.53, 0.78)
#sigma  <- 0.1
#mu0    <- 0.0
#sigma0 <- 1.0
#
### Derived values.
#s2 <- sigma * sigma
#s02 <- sigma0 * sigma0
#s02Inv <- 1.0 / s02
#c <- -1.0 / (2.0 * s2)
#
### Sampling model of Neal (JCGS, 2009)
### Function to perform an MCMC update of the parameter.
#sample.parameter <- function(indices=scalaType("D1"), parameter=scalaType("D0")) {
#  sum <- sum(data[indices])
#  variance <- 1 / (s02Inv + length(indices) / s2)
#  mean <- variance * (mu0 / s02 + sum / s2)
#  rnorm(1, mean, sqrt(variance))
#}
#
#library(rscala)
#s <- shallot:::s
#sample.parameter.compiled <- s(data=data,mu0=mu0,s2=s2,s02=s02,s02Inv=s02Inv) ^ sample.parameter
#
#
### Function to evaluate the likelihood contribution for an observation.
#log.density <- function(i=scalaType("D0"), indices=scalaType("D1"), parameter=scalaType("D0")) {
#  resid <- data[i] - parameter
#  c * resid * resid
#}
#
#log.density.compiled <- s(data=data,c=c) ^ log.density
#
#sampling.model <- sampling.model(sample.parameter, log.density)
#
### Perform posterior sampling.
#initial.partition <- rep(1,length(data))
#n.draws <- 10
#raw <- sample.partitions.posterior(initial.partition,sampling.model,partition.distribution,
#                                   massRWSD=3,temperatureRWSD=1,n.draws)
#samples.format1 <- process.samples(raw)
#parameterMatrix <- t(sapply(seq_len(n.draws), function(i) {
#  unlist(samples.format1$parameters[[i]])[samples.format1$labels[i,]]
#}))
#
#tail(samples.format1$hyperparameters)
#
### Shrinkage to group means?
#plot(data,apply(parameterMatrix,2,mean))
#abline(a=0,b=1)
#
#samples.format1$hyperparameters
#
### Post processing to find the partition estimate.
#library(sdols)
#pp <- expectedPairwiseAllocationMatrix(samples.format1$labels)
#est <- salso(pp)
#plot(confidence(est,pp))
#\dontshow{
#rscala::scalaDisconnect(shallot:::s)
#}
#}



