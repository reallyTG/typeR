library(hmm.discnp)


### Name: weissData
### Title: Data from "An Introduction to Discrete-Valued Time Series"
### Aliases: weissData Bovine Cryptosporidiosis Downloads EricssonB_Jul2
###   FattyLiver FattyLiver2 goldparticle380 Hanta InfantEEGsleepstates IPs
###   LegionnairesDisease OffshoreRigcountsAlaska PriceStability Strikes
###   WoodPeweeSong
### Keywords: datasets

### ** Examples

## Not run: 
##D fit1 <- hmm(WoodPeweeSong,K=2,verbose=TRUE)
##D # EM converges in 6 steps --- suspicious.
##D set.seed(321)
##D fit2 <- hmm(WoodPeweeSong,K=2,verbose=TRUE,rand.start=list(tpm=TRUE,Rho=TRUE))
##D # 52 steps --- note the huge difference between fit1$log.like and fit2$log.like!
##D set.seed(321)
##D fit3 <- hmm(WoodPeweeSong,K=2,verbose=TRUE,method="bf",
##D             rand.start=list(tpm=TRUE,Rho=TRUE))
##D # log likelihood essentially the same as for fit2
## End(Not run)



