library(qgtools)


### Name: stab.var
### Title: Within-group variance calculation with resampling techniques
### Aliases: stab.var
### Keywords: stab.var variation maize stability analysis

### ** Examples


 library(qgtools)
 data(maize)
 #names(maize)

 Geno=as.vector(maize$Cultivar)
 Env=paste(maize$Location,maize$Year,sep=":")
 y=maize$Yld

 res=stab.var(y,class=Geno,cls2=Env,resample="Boot",times=10)
 res

 res=stab.var(y,class=Geno,resample="Perm",times=10)
 res

 ##end






