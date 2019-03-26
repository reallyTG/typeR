library(faoutlier)


### Name: obs.resid
### Title: Model predicted residual outliers
### Aliases: obs.resid print.obs.resid plot.obs.resid
### Keywords: covariance

### ** Examples


## Not run: 
##D data(holzinger)
##D data(holzinger.outlier)
##D 
##D #Exploratory
##D nfact <- 3
##D (ORresult <- obs.resid(holzinger, nfact))
##D (ORresult.outlier <- obs.resid(holzinger.outlier, nfact))
##D plot(ORresult)
##D plot(ORresult.outlier)
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
##D (ORresult <- obs.resid(holzinger, model))
##D (ORresult.outlier <- obs.resid(holzinger.outlier, model))
##D plot(ORresult)
##D plot(ORresult.outlier)
##D 
##D #-------------------------------------------------------------------
##D #Confirmatory with lavaan
##D model <- 'F1 =~  Remndrs + SntComp + WrdMean
##D F2 =~ MissNum + MxdArit + OddWrds
##D F3 =~ Boots + Gloves + Hatchts'
##D 
##D (obs.resid2 <- obs.resid(holzinger, model, orthogonal=TRUE))
##D (obs.resid2.outlier <- obs.resid(holzinger.outlier, model, orthogonal=TRUE))
##D plot(obs.resid2)
##D plot(obs.resid2.outlier)
##D 
## End(Not run)



