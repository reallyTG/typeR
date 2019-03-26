library(RankResponse)


### Name: rank.L2R
### Title: Rank responses under the Bayesian framework according to the
###   loss function in Method 3 of Wang and Huang (2004).
### Aliases: rank.L2R

### ** Examples

## This is an example to rank three responses in a multiple response
## question when the number of respondents is 1000 and the value e 
## is 0.15. In this example, we do not use a real data, but generate 
## data in the first three lines.
A <-sample.int(2,1000,replace=TRUE,prob=c(0.37,0.63))-1
B <-sample.int(2,1000,replace=TRUE,prob=c(0.71,0.29))-1
C <-sample.int(2,1000,replace=TRUE,prob=c(0.22,0.78))-1
D <-cbind(A,B,C)
data <-matrix(D,nrow=1000,ncol=3)
## or upload the true data
response.number <-3
prior.parameter <- c(5,98,63,7,42,7,7,7)
e <- 0.15
rank.L2R(data,response.number,prior.parameter,e)



