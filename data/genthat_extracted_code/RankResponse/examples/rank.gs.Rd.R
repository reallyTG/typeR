library(RankResponse)


### Name: rank.gs
### Title: Rank responses based on the Generalized score test
### Aliases: rank.gs

### ** Examples

## This is an example to rank three responses in a multiple response question when
## the number of respondents is 1000 and the significance level is 0.05. In this
##example,we do not use a real data, but generate data in the first three lines.
A <-sample.int(2,1000,replace=TRUE,prob=c(0.21,0.79))-1
B <-sample.int(2,1000,replace=TRUE,prob=c(0.81,0.19))-1
C <-sample.int(2,1000,replace=TRUE,prob=c(0.62,0.28))-1
D <-cbind(A,B,C)
data <-matrix(D,nrow=1000,ncol=3)
## or upload the true data
alpha<-0.05
rank.gs(data,alpha,2)



