library(faoutlier)


### Name: LD
### Title: Likelihood Distance
### Aliases: LD print.LD plot.LD
### Keywords: cooks

### ** Examples


## Not run: 
##D 
##D #run all LD functions using multiple cores
##D setCluster()
##D 
##D #Exploratory
##D nfact <- 3
##D (LDresult <- LD(holzinger, nfact))
##D (LDresult.outlier <- LD(holzinger.outlier, nfact))
##D plot(LDresult)
##D plot(LDresult.outlier)
##D 
##D ## add a progress meter
##D LDresult <- LD(holzinger, nfact, progress = TRUE)
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
##D (LDresult <- LD(holzinger, model))
##D (LDresult.outlier <- LD(holzinger.outlier, model))
##D plot(LDresult)
##D plot(LDresult.outlier)
##D 
##D #-------------------------------------------------------------------
##D #Confirmatory with lavaan
##D model <- 'F1 =~  Remndrs + SntComp + WrdMean
##D F2 =~ MissNum + MxdArit + OddWrds
##D F3 =~ Boots + Gloves + Hatchts'
##D 
##D (LDresult <- LD(holzinger, model, orthogonal=TRUE))
##D (LDresult.outlier <- LD(holzinger.outlier, model, orthogonal=TRUE))
##D plot(LDresult)
##D plot(LDresult.outlier)
##D 
##D # categorical data with mirt
##D library(mirt)
##D data(LSAT7)
##D dat <- expand.table(LSAT7)
##D model <- mirt.model('F = 1-5')
##D LDresult <- LD(dat, model)
##D plot(LDresult)
##D 
## End(Not run)



