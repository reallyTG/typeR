library(sensR)


### Name: dodSim
### Title: Simulate data from the Degree-of-Difference model
### Aliases: dodSim
### Keywords: models

### ** Examples


## Simulate data from the DOD model with the equi.prob method:
set.seed(125)
(Data <- dodSim(d.prime=1, sample.size=100, method.tau="equi.prob"))

## Simulate data that maximizes the likelihood ratio statistic:
set.seed(125)
dodSim(d.prime=1, sample.size=100, method.tau="LR.max")

## Simulate with user-defined values for the boundary parameters:
dodSim(d.prime=1.5, sample.size=c(100, 100),
       method.tau="user.defined", tau=1:4)

## Simulate using different sample sizes for same-pairs and
## different-pairs:
dodSim(d.prime=1, ncat=3, sample.size=c(75, 125),
       method.tau="se.min")

## Don't show: 
## set.seed(1)
## a <- dodSim(sample.size = 10, replicates = 3, d.prime = 2,
##            method = "triangle", sd.indiv = 1)
## expect <- c(3L, 3L, 2L, 3L, 3L, 1L, 3L, 3L, 1L, 2L)
## stopifnot(all(a == expect))
## 
## End(Don't show)



