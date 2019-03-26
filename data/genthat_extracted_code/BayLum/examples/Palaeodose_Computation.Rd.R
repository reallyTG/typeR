library(BayLum)


### Name: Palaeodose_Computation
### Title: Bayesian analysis for the palaeodose estimation of various
###   samples
### Aliases: Palaeodose_Computation

### ** Examples

## Load data
data(DATA1,envir = environment())
## Palaeodose computation of samples GDB3
P=Palaeodose_Computation(DATA=DATA1,Nb_sample=1,SampleNames=c("GDB5"),Iter=100)




