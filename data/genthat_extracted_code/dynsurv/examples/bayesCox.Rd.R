library(dynsurv)


### Name: bayesCox
### Title: Fit Bayesian Cox Model for Interval Censored Survival Data
### Aliases: bayesCox
### Keywords: Bayesian Cox censor dynamic interval

### ** Examples

## Not run: 
##D library(dynsurv)
##D set.seed(1216)
##D 
##D ############################################################################
##D ### Attach one of the following two data sets
##D ############################################################################
##D 
##D ### breast cancer data
##D data(bcos)       # attach bcos and bcos.grid
##D mydata <- bcos
##D mygrid <- bcos.grid
##D myformula <- Surv(left, right, type = "interval2") ~ trt
##D 
##D ### tooth data
##D ## data(tooth)   # attach tooth and tooth.grid
##D ## mydata <- tooth
##D ## mygrid <- tooth.grid
##D ## myformula <- Surv(left, rightInf, type = "interval2") ~ dmf + sex
##D 
##D ############################################################################
##D ### Fit Bayesian Cox models
##D ############################################################################
##D 
##D ## Fit time-independent coefficient model
##D fit0 <- bayesCox(myformula, mydata, out = "tiCox.txt", model = "TimeIndep",
##D                  base.prior = list(type = "Gamma", shape = 0.1, rate = 0.1),
##D                  coef.prior = list(type = "Normal", mean = 0, sd = 1),
##D                  gibbs = list(iter = 100, burn = 20, thin = 1,
##D                               verbose = TRUE, nReport = 20))
##D plotCoef(coef(fit0, level = 0.9))
##D 
##D ## Plot the estimated survival function for given new data
##D newDat <- data.frame(trt = c("Rad", "RadChem"))
##D row.names(newDat) <- unique(newDat$trt)
##D plotSurv(survCurve(fit0, newDat), conf.int = TRUE)
##D 
##D ## Fit time-varying coefficient model
##D fit1 <- bayesCox(myformula, mydata, out = "tvCox.txt", model = "TimeVary",
##D                  base.prior = list(type = "Gamma", shape = 0.1, rate = 0.1),
##D                  coef.prior = list(type = "AR1", sd = 1),
##D                  gibbs = list(iter = 100, burn = 20, thin = 1,
##D                               verbose = TRUE, nReport = 20))
##D plotCoef(coef(fit1))
##D plotSurv(survCurve(fit1), conf.int = TRUE)
##D 
##D ## Fit dynamic coefficient model with time-varying baseline hazards
##D fit2 <- bayesCox(myformula, mydata, out = "dynCox1.txt", model = "Dynamic",
##D                  base.prior = list(type = "Gamma", shape = 0.1, rate = 0.1),
##D                  coef.prior = list(type = "HAR1", shape = 2, scale = 1),
##D                  gibbs = list(iter = 100, burn = 20, thin = 1,
##D                               verbose = TRUE, nReport = 20))
##D plotCoef(coef(fit2))
##D plotJumpTrace(jump(fit2))
##D plotJumpHist(jump(fit2))
##D plotNu(nu(fit2))
##D plotSurv(survCurve(fit2), conf.int = TRUE)
##D 
##D ## Plot the coefficient estimates from three models together
##D plotCoef(rbind(coef(fit0), coef(fit1), coef(fit2)))
##D 
##D ## Fit dynamic coefficient model with dynamic hazards (in log scales)
##D fit3 <- bayesCox(myformula, mydata, out = "dynCox2.txt", model = "Dynamic",
##D                  base.prior = list(type = "Const"),
##D                  coef.prior = list(type = "HAR1", shape = 2, scale = 1),
##D                  gibbs = list(iter = 100, burn = 20, thin = 1,
##D                               verbose = TRUE, nReport = 20),
##D                  control = list(intercept = TRUE))
##D plotCoef(coef(fit3))
##D plotJumpTrace(jump(fit3))
##D plotJumpHist(jump(fit3))
##D plotNu(nu(fit3))
##D plotSurv(survCurve(fit3), conf.int = TRUE)
##D 
##D ## Plot the estimated survival function and the difference
##D plotSurv(survCurve(fit3, newdata = newDat, type = "survival"),
##D          legendName = "Treatment", conf.int = TRUE)
##D plotSurv(survDiff(fit3, newdata = newDat, type = "survival"),
##D          legendName = "Treatment", conf.int = TRUE, smooth = TRUE)
## End(Not run)



