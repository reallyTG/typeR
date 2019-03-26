library(faoutlier)


### Name: forward.search
### Title: Forward search algorithm for outlier detection
### Aliases: forward.search print.forward.search plot.forward.search
### Keywords: forward.search

### ** Examples


## Not run: 
##D 
##D #run all internal gCD and GOF functions using multiple cores
##D setCluster()
##D 
##D #Exploratory
##D nfact <- 3
##D (FS <- forward.search(holzinger, nfact))
##D (FS.outlier <- forward.search(holzinger.outlier, nfact))
##D plot(FS)
##D plot(FS.outlier)
##D 
##D #Confirmatory with sem
##D model <- sem::specifyModel()
##D   F1 -> Remndrs,    lam11
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
##D 
##D (FS <- forward.search(holzinger, model))
##D (FS.outlier <- forward.search(holzinger.outlier, model))
##D plot(FS)
##D plot(FS.outlier)
##D 
##D #Confirmatory with lavaan
##D model <- 'F1 =~  Remndrs + SntComp + WrdMean
##D F2 =~ MissNum + MxdArit + OddWrds
##D F3 =~ Boots + Gloves + Hatchts'
##D 
##D (FS <- forward.search(holzinger, model))
##D (FS.outlier <- forward.search(holzinger.outlier, model))
##D plot(FS)
##D plot(FS.outlier)
##D 
##D 
## End(Not run)



