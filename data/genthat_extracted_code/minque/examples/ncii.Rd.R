library(minque)


### Name: ncii
### Title: NC design II F1 data
### Aliases: ncii
### Keywords: datasets MINQUE REML variance components jackknife

### ** Examples

 library(minque)
 data(ncii)

 res=lmm(Yld~1|Female*Male+Rep,data=ncii)
 res[[1]]$Var
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect

 res=lmm.jack(Yld~1|Female*Male+Rep,data=ncii,
    method=c("reml","minque"),JacNum=10,JacRep=1,ALPHA=0.05)
 res[[1]]$Var
 res[[1]]$PVar
 
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect




