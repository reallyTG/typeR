library(GJRM)


### Name: meps
### Title: MEPS data
### Aliases: meps

### ** Examples


## Not run: 
##D  
##D 
##D ###################################################
##D ###################################################
##D 
##D library("GJRM")
##D data("meps", package = "GJRM") 
##D 
##D ###################################################
##D # Bivariate brobit models with endogenous treatment
##D ###################################################
##D 
##D treat.eq <- private ~ s(bmi) + s(income) + s(age) + s(education) +
##D                       as.factor(health) + as.factor(race) +
##D                       as.factor(limitation) + as.factor(region) + 
##D                       gender  + hypertension + hyperlipidemia + diabetes
##D out.eq <- visits.hosp ~ private + s(bmi) + s(income) + s(age) + 
##D                         s(education) + as.factor(health) + 
##D                         as.factor(race) + as.factor(limitation) + 
##D                         as.factor(region) + gender + hypertension + 
##D                         hyperlipidemia + diabetes
##D 
##D f.list <- list(treat.eq, out.eq) 
##D mr     <- c("probit", "probit")
##D bpN    <- gjrm(f.list, data = meps, margins = mr, Model = "B")
##D bpF    <- gjrm(f.list, data = meps, margins = mr, BivD = "F", Model = "B")
##D bpC0   <- gjrm(f.list, data = meps, margins = mr, BivD = "C0", Model = "B")
##D bpC180 <- gjrm(f.list, data = meps, margins = mr, BivD = "C180", Model = "B")
##D bpJ0   <- gjrm(f.list, data = meps, margins = mr, BivD = "J0", Model = "B")
##D bpJ180 <- gjrm(f.list, data = meps, margins = mr, BivD = "J180", Model = "B")
##D bpG0   <- gjrm(f.list, data = meps, margins = mr, BivD = "G0", Model = "B")
##D bpG180 <- gjrm(f.list, data = meps, margins = mr, BivD = "G180", Model = "B")
##D 
##D conv.check(bpJ0)
##D 
##D AIC(bpN, bpF, bpC0, bpC180, bpJ0, bpJ180, bpG0, bpG180) 
##D 
##D set.seed(1)
##D summary(bpJ0, cex.axis = 1.6, 
##D         cex.lab = 1.6, cex.main = 1.7)
##D 
##D #dev.copy(postscript, "contplot.eps")
##D #dev.off()
##D 
##D par(mfrow = c(2, 2), mar = c(4.5, 4.5, 2, 2), 
##D     cex.axis = 1.6, cex.lab = 1.6)
##D plot(bpJ0, eq = 1, seWithMean = TRUE, scale = 0, shade = TRUE, 
##D      pages = 1, jit = TRUE)
##D 
##D #dev.copy(postscript, "spline1.eps")
##D #dev.off() 
##D 
##D par(mfrow = c(2, 2), mar = c(4.5, 4.5, 2, 2), 
##D     cex.axis = 1.6, cex.lab = 1.6)
##D plot(bpJ0, eq = 2, seWithMean = TRUE, scale = 0, shade = TRUE, 
##D      pages = 1, jit = TRUE)
##D 
##D #dev.copy(postscript, "spline2.eps")
##D #dev.off() 
##D 
##D set.seed(1)
##D AT(bpJ0, nm.end = "private", hd.plot = TRUE, cex.axis = 1.5, 
##D    cex.lab = 1.5, cex.main = 1.6)
##D 
##D #dev.copy(postscript, "hd.plotAT.eps")
##D #dev.off()
##D 
##D AT(bpJ0, nm.end = "private", type = "univariate")
##D 
##D AT(bpJ0, nm.end = "private", type = "naive")
##D 
## End(Not run)

#




