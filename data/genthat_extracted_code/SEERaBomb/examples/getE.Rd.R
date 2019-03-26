library(SEERaBomb)


### Name: getE
### Title: Get expected numbers of cases
### Aliases: getE
### Keywords: internal

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D pm=simSeerSet()
##D pm=mk2D(pm,secondS="B") 
##D L=post1PYO(pm$canc,brks=c(0,2,5),binIndx=1,Trt="rad",yearEnd=2012 )
##D names(L)
##D names(pm)
##D with(pm,getE(L$LPYM,D,ageStart,ageEnd,yearEnd,cancerS,secondS))
## End(Not run)



