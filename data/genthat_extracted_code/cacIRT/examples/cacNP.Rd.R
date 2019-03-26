library(cacIRT)


### Name: Nonparametric Approach to CA and CC
### Title: Computes classification accuracy and consistency using Lathrop
###   and Cheng's (2014) nonparametric approach.
### Aliases: Lee.pnr pnr
### Keywords: ~IRT

### ** Examples

#Simulate simple response data

params <- matrix(c(1,1,1,1,-2,1,0,1,0,0,0,0),4,3)
theta <- rnorm(100)
rdm <- sim(params, theta)

pnr.out <- pnr(rdm)

resultsNP <- Lee.pnr(3, pnr.out)



