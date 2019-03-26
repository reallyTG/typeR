library(multilevel)


### Name: rwg.j.lindell
### Title: Lindell et al. r*wg(j) agreement index for multi-item scales
### Aliases: rwg.j.lindell
### Keywords: attribute

### ** Examples

data(lq2002)
RWGOUT<-rwg.j.lindell(lq2002[,3:13],lq2002$COMPID)
RWGOUT[1:10,]
summary(RWGOUT)



