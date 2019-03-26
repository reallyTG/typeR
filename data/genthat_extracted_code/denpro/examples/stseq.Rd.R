library(denpro)


### Name: stseq
### Title: Calculates a sequence of radius functions from a sequence of
###   level sets
### Aliases: stseq
### Keywords: multivariate

### ** Examples

N<-c(32,32)
lnum<-30
func<-"prod"
marginal<-"student"
yla<-5
support<-c(-yla,yla,-yla,yla)
g<-c(1,3)
st<-stseq(N,lnum,func=func,marginal=marginal,support=support,g=g)

gnum<-70  
vd<-shape2d(st,gnum=gnum)
plotvolu2d(vd)




