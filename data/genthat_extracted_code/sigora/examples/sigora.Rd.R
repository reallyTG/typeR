library(sigora)


### Name: sigora
### Title: Sigora's main function.
### Aliases: sigora
### Keywords: functions

### ** Examples

## Not run: 
##D ##query list
##D ils<-grep("^IL",idmap[["Symbol"]],value=TRUE)
##D ## using precompiled GPS repository:
##D sigRes.ilreact<-sigora(queryList=ils,GPSrepo=reaH,level=3)
##D ## user created GPS repository:
##D nciH<-makeGPS(pathwayTable=nciTable)
##D sigRes.ilnci<-sigora(queryList=ils,GPSrepo=nciH,level=2)
##D ## user defined weighting schemes :
##D myfunc<-function(a,b){1/log(a+b)}
##D sigora(queryList=ils,GPSrepo=nciH,level=2, weighting.method ="myfunc")
## End(Not run)



