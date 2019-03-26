library(netCoin)


### Name: sim
### Title: Similarity matrix.
### Aliases: sim

### ** Examples

# From a random incidence matrix I(25X4)
I<-matrix(rbinom(100,1,.5),nrow=25,ncol=4,
   dimnames=list(NULL,c("A","B","C","D")))
sim(I)
#Same results
C<-coin(I)
sim(C)




