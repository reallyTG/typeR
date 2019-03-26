library(boostmtree)


### Name: simLong
### Title: Simulate longitudinal data
### Aliases: simLong
### Keywords: simulation variable selection

### ** Examples

## Not run: 
##D ##------------------------------------------------------------
##D ##
##D ##  test how well we can select variables
##D ##----------------------------------------------------------------------------
##D 
##D 
##D ## set the number of boosting iterations
##D M <- 500
##D 
##D ## simulation 0: only main effects (x1, x3, x4)
##D dta <- simLong(n = 100, ntest = 100, model = 0, q = 5)
##D trn <- dta$trn
##D dtaL <- dta$dtaL
##D dta <- dta$dta
##D obj.0 <- boostmtree(dtaL$features[trn, ], dtaL$time[trn], dtaL$id[trn], dtaL$y[trn], M = M)
##D pred.0 <- predict(obj.0, dtaL$features[-trn, ], dtaL$time[-trn], dtaL$id[-trn], dtaL$y[-trn])
##D vimp.0 <- pred.0$vimp
##D 
##D ## simulation 3: main effects (x1, x3, x4), time-interactions (x2, x3)
##D dta <- simLong(n = 100, ntest = 100, model = 3, q = 5)
##D trn <- dta$trn
##D dtaL <- dta$dtaL
##D dta <- dta$dta
##D obj.3 <- boostmtree(dtaL$features[trn, ], dtaL$time[trn], dtaL$id[trn], dtaL$y[trn], M = M)
##D pred.3 <- predict(obj.3, dtaL$features[-trn, ], dtaL$time[-trn], dtaL$id[-trn], dtaL$y[-trn])
##D vimp.3 <- pred.3$vimp
##D 
##D ## plot vimp side by side
##D barplot(rbind(vimp.0,vimp.3),beside=T,las=2,
##D     ylab="standardized vimp", args.legend = list(x = "topleft"),
##D     col = c(2, 4), legend.text = c("model 0", "model 3"))
##D 
## End(Not run)



