library(popbio)


### Name: aq.matrix
### Title: Create a projection matrix for Aquilegia
### Aliases: aq.matrix
### Keywords: survey

### ** Examples


data(aq.trans)

x<-subset(aq.trans, year==1996)

## number of recruits in 1997  
 rec<-nrow(subset(aq.trans, year==1997 & stage == "recruit"))

aq.matrix(x, recruits=rec)
aq.matrix(x, recruits=rec, seed.survival=.7, seed.bank=3000)





