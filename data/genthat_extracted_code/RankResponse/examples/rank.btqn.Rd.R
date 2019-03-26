library(RankResponse)


### Name: rank.btqn
### Title: Rank responses based on the Bradley-Terry model with the
###   quasi-Newton accelerated MM method
### Aliases: rank.btqn

### ** Examples

## This is an example to rank three responses in a multiple response question when
## the number of respondents is 1000. In this example, we do not use a real data,
## but generate data in the first three lines.
A <-sample.int(2,1000,replace=TRUE,prob=c(0.37,0.63))-1
B <-sample.int(2,1000,replace=TRUE,prob=c(0.65,0.35))-1
C <-sample.int(2,1000,replace=TRUE,prob=c(0.5,0.5))-1
D <-cbind(A,B,C)
data <-matrix(D,nrow=1000,ncol=3)
## or upload the true data
rank.btqn(data)



