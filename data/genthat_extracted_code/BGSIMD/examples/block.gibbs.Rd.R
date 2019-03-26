library(BGSIMD)


### Name: block.gibbs
### Title: Efficient Block Gibbs Sampling with Incomplete Data from a
###   Multinomial Distribution
### Aliases: block.gibbs
### Keywords: distribution

### ** Examples

complete<-c(20,655,17,15,11,8,5,10,4) # so k=9, and 
# there are 20 observed counts of 1's, 655 counts of 2's, etc.
missing<-c(34,21,18) # so m=3 
ms<-list(c(3,4),c(5,6,7),c(6,7,8,9)) # three kind of
#  missing data, namely, some data are only known to belong to {3,4},
# some known to belong to {5,6,7} and some belong to {6,7,8,9}.
prior<-rep(1,9)
init<-rep(1/9,9)
n<-110 
block.temp<-block.gibbs(complete,missing,ms,prior,init,n) # obtain 110 samples
apply(block.temp[,11:110],1,mean) # burn-in is 10 and obtain the posterior mean



