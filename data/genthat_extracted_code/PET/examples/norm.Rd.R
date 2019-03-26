library(PET)


### Name: norm
### Title: L1 and L2 norm
### Aliases: norm
### Keywords: math smooth

### ** Examples

P <- phantom(n=101)
P.pois <- markPoisson(P)$Data
cat("The L1 is:",norm(P, P.pois, mode="L1"),"\n")
rm(P,P.pois)



