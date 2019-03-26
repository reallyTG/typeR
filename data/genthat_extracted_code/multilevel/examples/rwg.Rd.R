library(multilevel)


### Name: rwg
### Title: James et al., (1984) agreement index for single item measures
### Aliases: rwg
### Keywords: attribute

### ** Examples

data(lq2002)
RWGOUT<-rwg(lq2002$LEAD,lq2002$COMPID)
RWGOUT[1:10,]
summary(RWGOUT)




