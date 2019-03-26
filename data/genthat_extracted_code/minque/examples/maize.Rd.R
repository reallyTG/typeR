library(minque)


### Name: maize
### Title: Maize variety trial
### Aliases: maize
### Keywords: datasets maize MINQUE

### ** Examples

 
 library(minque)
 data(maize)
 #names(maize)

 res=lmm(Yld~1|Cultivar*Year+Cultivar*Location+Year*Location,data=maize)
 res[[1]]$Var
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect

 res=lmm.jack(Yld~1|Cultivar*Year+Cultivar*Location+Year*Location,
    data=maize,JacNum=10,JacRep=1,ALPHA=0.05)
 res[[1]]$Var
 res[[1]]$PVar
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect
 
 ##End




