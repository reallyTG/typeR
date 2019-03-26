library(pps)


### Name: stratsrs
### Title: Stratified simple random sampling
### Aliases: stratsrs
### Keywords: survey

### ** Examples

strat <- c(1,1,1,1,1,2,2,2,3,3,3,3,3,3,3)  # stratum 1 has 5 units, etc. 
nh <- c(2,1,3)  # select 2 units from stratum 1, 1 from stratum 2 and 3 from 3
stratsrs(strat,nh)



