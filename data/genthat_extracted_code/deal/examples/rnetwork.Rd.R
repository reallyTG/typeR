library(deal)


### Name: rnetwork
### Title: Simulation of data sets with a given dependency structure
### Aliases: rnetwork
### Keywords: models

### ** Examples

A  <- factor(NA,levels=paste("A",1:2,sep=""))
B  <- factor(NA,levels=paste("B",1:3,sep=""))
c1 <- NA
c2 <- NA
df <- data.frame(A,B,c1,c2)

nw <- network(df,doprob=FALSE) # doprob must be FALSE
nw <- makesimprob(nw)          # create simprob properties

set.seed(944) 
sim <- rnetwork(nw,n=100)    # create simulated data frame



