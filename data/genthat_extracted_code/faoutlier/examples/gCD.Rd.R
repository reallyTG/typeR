library(faoutlier)


### Name: gCD
### Title: Generalized Cook's Distance
### Aliases: gCD print.gCD plot.gCD
### Keywords: cooks

### ** Examples


## Not run: 
##D 
##D #run all gCD functions using multiple cores
##D setCluster()
##D 
##D #Exploratory
##D nfact <- 3
##D (gCDresult <- gCD(holzinger, nfact))
##D (gCDresult.outlier <- gCD(holzinger.outlier, nfact))
##D plot(gCDresult)
##D plot(gCDresult.outlier)
##D 
##D ## include a progress bar
##D gCDresult <- gCD(holzinger, nfact, progress = TRUE)
##D 
##D #-------------------------------------------------------------------
##D #Confirmatory with sem
##D model <- sem::specifyModel()
##D    F1 -> Remndrs,    lam11
##D 	  F1 -> SntComp,    lam21
##D 	  F1 -> WrdMean,    lam31
##D 	  F2 -> MissNum,    lam41
##D 	  F2 -> MxdArit,    lam52
##D 	  F2 -> OddWrds,    lam62
##D 	  F3 -> Boots,      lam73
##D   F3 -> Gloves,     lam83
##D 	  F3 -> Hatchts,    lam93
##D 	  F1 <-> F1,   NA,     1
##D 	  F2 <-> F2,   NA,     1
##D 	  F3 <-> F3,   NA,     1
##D 
##D (gCDresult2 <- gCD(holzinger, model))
##D (gCDresult2.outlier <- gCD(holzinger.outlier, model))
##D plot(gCDresult2)
##D plot(gCDresult2.outlier)
##D 
##D #-------------------------------------------------------------------
##D #Confirmatory with lavaan
##D model <- 'F1 =~  Remndrs + SntComp + WrdMean
##D F2 =~ MissNum + MxdArit + OddWrds
##D F3 =~ Boots + Gloves + Hatchts'
##D 
##D (gCDresult2 <- gCD(holzinger, model, orthogonal=TRUE))
##D (gCDresult2.outlier <- gCD(holzinger.outlier, model, orthogonal=TRUE))
##D plot(gCDresult2)
##D plot(gCDresult2.outlier)
##D 
##D # categorical data with mirt
##D library(mirt)
##D data(LSAT7)
##D dat <- expand.table(LSAT7)
##D model <- mirt.model('F = 1-5')
##D result <- gCD(dat, model)
##D plot(result)
##D 
##D mod <- mirt(dat, model)
##D res <- residuals(mod, type = 'exp')
##D cbind(res, gCD=round(result$gCD, 3))
##D 
## End(Not run)



