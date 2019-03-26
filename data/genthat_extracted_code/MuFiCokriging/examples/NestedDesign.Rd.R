library(MuFiCokriging)


### Name: NestedDesign
### Title: Definition of nested experimental design sets for Multi-Fidelity
###   Cokriging models
### Aliases: NestedDesign

### ** Examples

#-- Nested Experimental design sets
	dimension <- 3
	nD1 <- 100
	nD2 <- 50		
	nD3 <- 20
	set.seed(1);D1 <- matrix(runif(n=nD1*dimension, 0,1),ncol=dimension)
	NestDesign <- NestedDesign(D1, nlevel=3 , n = c(nD2,nD3))



