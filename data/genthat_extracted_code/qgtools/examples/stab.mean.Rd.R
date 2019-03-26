library(qgtools)


### Name: stab.mean
### Title: Group mean and rank calculator
### Aliases: stab.mean
### Keywords: stab.mean stability rank mean resampling bootstrapping
###   permutation maize

### ** Examples

 
 ##Sample R codes for the function genmod.rank
 library(qgtools)
 data(maize)
 #names(maize)

 Geno=as.vector(maize$Cultivar)
 Env=paste(maize$Location,maize$Year,sep=":")
 y=maize$Yld

 res=stab.mean(y,class=Geno,cls2=Env,resample="Boot",times=10)
 res

 res=stab.mean(y,class=Geno,resample="Perm",times=10)
 res

 ##end





