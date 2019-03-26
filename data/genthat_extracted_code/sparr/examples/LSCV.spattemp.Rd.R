library(sparr)


### Name: LIK.spattemp
### Title: Cross-validation bandwidths for spatiotemporal kernel density
###   estimates
### Aliases: LSCV.spattemp LIK.spattemp

### ** Examples

## No test: 

data(burk) # Burkitt's Uganda lymphoma data
burkcas <- burk$cases

hlam1 <- LSCV.spattemp(burkcas) #~9 secs
hlam2 <- LSCV.spattemp(burkcas,tlim=c(400,5800)) 
hlam3 <- LSCV.spattemp(burkcas,start=c(7,400))
rbind(hlam1,hlam2,hlam3)

hlam1 <- LIK.spattemp(burkcas) #~3 secs
hlam2 <- LIK.spattemp(burkcas,tlim=c(400,5800)) 
hlam3 <- LIK.spattemp(burkcas,start=c(7,400))
rbind(hlam1,hlam2,hlam3)

## End(No test)



