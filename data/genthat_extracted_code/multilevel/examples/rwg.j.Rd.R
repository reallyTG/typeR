library(multilevel)


### Name: rwg.j
### Title: James et al., (1984) agreement index for multi-item scales
### Aliases: rwg.j
### Keywords: attribute

### ** Examples

data(lq2002)
RWGOUT<-rwg.j(lq2002[,3:13],lq2002$COMPID)
RWGOUT[1:10,]
summary(RWGOUT)



