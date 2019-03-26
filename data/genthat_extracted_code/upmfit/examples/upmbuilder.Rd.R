library(upmfit)


### Name: upmbuilder
### Title: Bayesian Markov Chain Monte Carlo model building for
###   household-community tuberculosis transmission models
### Aliases: upmbuilder

### ** Examples

upmbuilder(design.matrix=upmdata)

upmbuilder(design.matrix=upmdata, prior.alpha=c(-2.2,round(1/sqrt(3),3)))
suppressWarnings(cat(upmbuilder(design.matrix=upmdata,
prior.alpha=c(-2.2,round(1/sqrt(3),3)))[[1]]))




