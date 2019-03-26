library(ppsbm)


### Name: tauKmeansSbm
### Title: k-means for SBM
### Aliases: tauKmeansSbm

### ** Examples


n <- 50
Q <- 3

Dmax <- 2^3

Nijk <- statistics(generated_Q3$data,n,Dmax,directed=FALSE)

tau <- tauKmeansSbm(Nijk,n,Q,FALSE)




