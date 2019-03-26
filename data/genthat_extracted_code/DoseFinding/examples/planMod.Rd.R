library(DoseFinding)


### Name: planMod
### Title: Evaluate performance metrics for fitting dose-response models
### Aliases: planMod plot.planMod summary.planMod

### ** Examples

## Not run: 
##D doses <- c(0,10,25,50,100,150)
##D fmodels <- Mods(linear = NULL, emax = 25,
##D                 logistic = c(50, 10.88111), exponential= 85,
##D                 betaMod=rbind(c(0.33,2.31),c(1.39,1.39)),
##D                 doses = doses, addArgs=list(scal = 200),
##D                 placEff = 0, maxEff = 0.4)
##D sigma <- 1
##D n <- rep(62, 6)*2
##D 
##D model <- "quadratic"
##D pObj <- planMod(model, fmodels, n, sigma, doses=doses,
##D                simulation = TRUE, 
##D                alpha = 0.025, nSim = 200, 
##D                p = 0.5, pLB = 0.25, pUB = 0.75)
##D print(pObj)
##D ## to get additional metrics (e.g. Eff-vs-ANOVA, cRMSE, lengthTDCI, ...)
##D summary(pObj, p = 0.5, Delta = 0.3)
##D plot(pObj)
##D plot(pObj, type = "TD", Delta=0.3)
##D plot(pObj, type = "ED", p = 0.5)
## End(Not run)



