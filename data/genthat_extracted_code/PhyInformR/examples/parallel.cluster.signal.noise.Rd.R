library(PhyInformR)


### Name: parallel.cluster.signal.noise
### Title: Quantify Quartet Resolution Probabilities Using 2012 Formulation
###   and MCMC approach in parallel
### Aliases: parallel.cluster.signal.noise
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("doParallel")
#Cores must be less than or equal to those had on your machine.
#registerDoParallel(cores=2)
as.matrix(rag1)->rr
parallel.cluster.signal.noise(100, 2, rr, 10, 3,
filename="output_values", imagename="output_graphic", image = "TRUE") 



