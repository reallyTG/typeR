library(faoutlier)


### Name: GOF
### Title: Goodness of Fit Distance
### Aliases: GOF print.GOF plot.GOF
### Keywords: cooks

### ** Examples


## Not run: 
##D 
##D #run all GOF functions using multiple cores
##D setCluster()
##D 
##D #Exploratory
##D nfact <- 3
##D (GOFresult <- GOF(holzinger, nfact))
##D (GOFresult.outlier <- GOF(holzinger.outlier, nfact))
##D plot(GOFresult)
##D plot(GOFresult.outlier)
##D 
##D ## include a progress bar
##D GOFresult <- GOF(holzinger, nfact, progress = TRUE)
##D 
##D #-------------------------------------------------------------------
##D #Confirmatory with sem
##D model <- sem::specifyModel()
##D   F1 -> Remndrs,    lam11
##D 	  F1 -> SntComp,    lam21
##D 	  F1 -> WrdMean,    lam31
##D 	  F2 -> MissNum,    lam42
##D 	  F2 -> MxdArit,    lam52
##D 	  F2 -> OddWrds,    lam62
##D 	  F3 -> Boots,      lam73
##D   F3 -> Gloves,     lam83
##D 	  F3 -> Hatchts,    lam93
##D 	  F1 <-> F1,   NA,     1
##D 	  F2 <-> F2,   NA,     1
##D 	  F3 <-> F3,   NA,     1
##D 
##D (GOFresult <- GOF(holzinger, model))
##D (GOFresult.outlier <- GOF(holzinger.outlier, model))
##D plot(GOFresult)
##D plot(GOFresult.outlier)
##D 
##D #-------------------------------------------------------------------
##D #Confirmatory with lavaan
##D model <- 'F1 =~  Remndrs + SntComp + WrdMean
##D F2 =~ MissNum + MxdArit + OddWrds
##D F3 =~ Boots + Gloves + Hatchts'
##D 
##D (GOFresult <- GOF(holzinger, model, orthogonal=TRUE))
##D (GOFresult.outlier <- GOF(holzinger.outlier, model, orthogonal=TRUE))
##D plot(GOFresult)
##D plot(GOFresult.outlier)
##D 
##D 
##D # categorical data with mirt
##D library(mirt)
##D data(LSAT7)
##D dat <- expand.table(LSAT7)
##D model <- mirt.model('F = 1-5')
##D result <- GOF(dat, model)
##D plot(result)
##D 
## End(Not run)



