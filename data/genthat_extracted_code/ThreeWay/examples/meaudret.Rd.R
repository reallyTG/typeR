library(ThreeWay)


### Name: meaudret
### Title: Meaudret data
### Aliases: meaudret
### Keywords: data array multivariate

### ** Examples

data(meaudret)
## The labels are in the data array
laba <- dimnames(meaudret)[[1]]
labb <- dimnames(meaudret)[[2]]
labc <- dimnames(meaudret)[[3]]
## Candecomp/Parafac analysis
## Not run: 
##D CP(meaudret,laba,labb,labc)
##D ## Tucker3 analysis
##D T3(meaudret,laba,labb,labc)
##D ## Tucker2 analysis
##D T2(meaudret,laba,labb,labc)
##D ## Tucker1 analysis
##D T1(meaudret,laba,labb,labc)
## End(Not run)



