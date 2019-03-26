library(minque)


### Name: brate
### Title: Cotton boll retention rate data
### Aliases: brate
### Keywords: datasets cotton boll retention linear mixed model MINQUE REML
###   resampling jackknife

### ** Examples


 library(minque)

 data(brate)
 head(brate)
 brate$Geno=factor(brate$Geno)
 brate$Pos=factor(brate$Pos)
 brate$Rep=factor(brate$Rep)
 
 res=lmm(Brate~1|Geno*Pos+Rep,data=brate)
 res[[1]]$Var
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect

 res=lmm.jack(Brate~1|Geno*Pos+Rep,data=brate,JacNum=10,JacRep=1,ALPHA=0.05)
 res[[1]]$Var
 res[[1]]$PVar
 res[[1]]$FixedEffect
 res[[1]]$RandomEffect
 ## end



