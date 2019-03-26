library(pps)


### Name: ppssstrat
### Title: Stratified PPS systematic sampling
### Aliases: ppssstrat
### Keywords: survey

### ** Examples

sizes <- c(1:5,10:6)*10
strat <- c(1,1,1,2,2,3,3,3,3,3)
n <- c(2,1,3)
ppssstrat(sizes,strat,n)



