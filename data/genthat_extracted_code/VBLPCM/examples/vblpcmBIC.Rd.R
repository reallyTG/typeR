library(VBLPCM)


### Name: vblpcmbic
### Title: calculate the BIC for the fitted VBLPCM object
### Aliases: vblpcmbic
### Keywords: BIC

### ** Examples

data(sampson)
set.seed(1)
### plot the BIC for G=2,3,4 groups 
gbic<-list(groups=NULL,bic=NULL)
for (g in 2:4)
  {
  v.fit<-vblpcmfit(vblpcmstart(samplike,G=g,LSTEPS=1e3),STEPS=20)
  gbic$groups[g]=v.fit$G
  gbic$bic[g]=v.fit$BIC$overall
  }
plot(gbic$groups, gbic$bic, main="BIC results", xlab="# groups", ylab="BIC", t='b')



