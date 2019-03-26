library(boostmtree)


### Name: predict.boostmtree
### Title: Prediction for Boosted multivariate trees for longitudinal data.
### Aliases: predict.boostmtree
### Keywords: predict boosting

### ** Examples

## Not run: 
##D ##------------------------------------------------------------
##D ## Synthetic example
##D ##
##D ##  high correlation, quadratic time with quadratic interaction
##D ##  largish number of noisy variables
##D ##
##D ##  illustrates how modified gradient improves performance
##D ##  also compares performance to ideal and well specified linear models 
##D ##----------------------------------------------------------------------------
##D 
##D ## simulate the data
##D ## simulation 2: main effects (x1, x3, x4), quad-time-interaction (x2)
##D dtaO <- simLong(n = 100, ntest = 100, model = 2, q = 25)
##D 
##D ## save the data as both a list and data frame
##D dtaL <- dtaO$dtaL
##D dta <- dtaO$dta
##D 
##D ## get the training data
##D trn <- dtaO$trn
##D 
##D ## save formulas for linear model comparisons
##D f.true <- dtaO$f.true
##D f.linr <- "y~x1+x2+x3+x4+x1*time+x2*time+x3*time+x4*time"
##D 
##D 
##D ## modified tree gradient (default)
##D o.1 <- boostmtree(dtaL$features[trn, ], dtaL$time[trn], dtaL$id[trn],dtaL$y[trn],
##D          M = 350)
##D p.1 <- predict(o.1, dtaL$features[-trn, ], dtaL$time[-trn], dtaL$id[-trn], dtaL$y[-trn])
##D 
##D ## non-modified tree gradient (nmtg)
##D o.2 <- boostmtree(dtaL$features[trn, ], dtaL$time[trn], dtaL$id[trn], dtaL$y[trn],
##D              M = 350, mod.grad = FALSE)
##D p.2 <- predict(o.2, dtaL$features[-trn, ], dtaL$time[-trn], dtaL$id[-trn], dtaL$y[-trn])
##D 
##D ## set rho = 0
##D o.3 <- boostmtree(dtaL$features[trn, ], dtaL$time[trn], dtaL$id[trn], dtaL$y[trn],
##D              M = 350, rho = 0)
##D p.3 <- predict(o.3, dtaL$features[-trn, ], dtaL$time[-trn], dtaL$id[-trn], dtaL$y[-trn])
##D 
##D 
##D ##rmse values compared to generalized least squares (GLS)
##D ##for true model and well specified linear models (LM)
##D cat("true LM           :", boostmtree:::gls.rmse(f.true,dta,trn),"\n")
##D cat("well specified LM :", boostmtree:::gls.rmse(f.linr,dta,trn),"\n")
##D cat("boostmtree        :", p.1$rmse,"\n")
##D cat("boostmtree  (nmtg):", p.2$rmse,"\n")
##D cat("boostmtree (rho=0):", p.3$rmse,"\n")
##D 
##D ##predicted value plots
##D plot(p.1)
##D plot(p.2)
##D plot(p.3)
## End(Not run)



