library(Ake)


### Name: hcvd.fun
### Title: Cross-validation function for bandwidth selection in p.m.f.
###   estimation
### Aliases: hcvd.fun hcvd.fun.default
### Keywords: smooth bandwidth selection nonparametric

### ** Examples

## Data can be simulated data or real data
## We use real data 
## and then compute the cross validation. 
Vec<-c(10,0,1,0,4,0,6,0,0,0,1,1,1,2,4,4,5,6,6,6,6,7,1,7,0,7,7,
7,8,0,8,12,8,8,9,9,0,9,9,10,10,10,10,0,10,10,11,12,12,10,12,12,
13,14,15,16,16,17,0,12)
## Not run: 
##D CV<-hcvd.fun(Vec,NULL,"bino")
##D CV$hcv
## End(Not run)
##The cross validation function can be also ploted.
## Not run: 
##D plot.fun(CV$seq_bws,CV$CV, type="l")
## End(Not run)




