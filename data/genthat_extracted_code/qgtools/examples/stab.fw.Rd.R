library(qgtools)


### Name: stab.fw
### Title: Resgression based stability analysis
### Aliases: stab.fw
### Keywords: regression stability resampling maize fw stability analysis

### ** Examples

 
 library(qgtools)
 data(maize)
 #names(maize)

 Geno=as.vector(maize$Cultivar)
 Env=paste(maize$Location,maize$Year,sep=":")
 y=maize$Yld

 res=stab.fw(y,Gen=Geno,Env=Env,times=10,Rep=TRUE)
 res

 ##end




