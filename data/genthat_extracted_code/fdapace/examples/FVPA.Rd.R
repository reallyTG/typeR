library(fdapace)


### Name: FVPA
### Title: Functional Variance Process Analysis for dense functional data
### Aliases: FVPA

### ** Examples

set.seed(1)
n <- 25
pts <- seq(0, 1, by=0.01)
sampWiener <- Wiener(n, pts)
# Data have to dense for FVPA to be relevant!
sampWiener <- Sparsify(sampWiener, pts, 101) 
fvpaObj <- FVPA(sampWiener$Ly, sampWiener$Lt)



