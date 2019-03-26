library(AICcmodavg)


### Name: importance
### Title: Compute Importance Values of Variable
### Aliases: importance importance.default importance.AICaov.lm
###   importance.AICbetareg importance.AICsclm.clm importance.AICclmm
###   importance.AICclm importance.AICclogit.coxph importance.AICcoxme
###   importance.AICcoxph importance.AICglm.lm importance.AICglmerMod
###   importance.AICgls importance.AIChurdle importance.AIClm
###   importance.AIClme importance.AIClmekin importance.AICmaxlikeFit.list
###   importance.AICmer importance.AICmultinom.nnet importance.AICnlmerMod
###   importance.AICpolr importance.AICrlm.lm importance.AICsurvreg
###   importance.AICunmarkedFitColExt importance.AICunmarkedFitOccu
###   importance.AICunmarkedFitOccuFP importance.AICunmarkedFitOccuRN
###   importance.AICunmarkedFitPCount importance.AICunmarkedFitPCO
###   importance.AICunmarkedFitDS importance.AICunmarkedFitGDS
###   importance.AICunmarkedFitMPois importance.AICunmarkedFitGMM
###   importance.AICvglm importance.AICzeroinfl print.importance
### Keywords: models

### ** Examples

##example on Orthodont data set in nlme
## Not run: 
##D require(nlme)
##D 
##D ##set up candidate model list
##D Cand.models <- list( )
##D Cand.models[[1]] <- lme(distance ~ age, data = Orthodont, method = "ML")
##D ##random is ~ age | Subject
##D Cand.models[[2]] <- lme(distance ~ age + Sex, data = Orthodont,
##D                         random = ~ 1, method = "ML")
##D Cand.models[[3]] <- lme(distance ~ 1, data = Orthodont, random = ~ 1,
##D                         method = "ML") 
##D Cand.models[[4]] <- lme(distance ~ Sex, data = Orthodont, random = ~ 1,
##D                         method = "ML") 
##D 
##D ##create a vector of model names
##D Modnames <- paste("mod", 1:length(Cand.models), sep = "")
##D 
##D importance(cand.set = Cand.models, parm = "age", modnames = Modnames,
##D            second.ord = TRUE, nobs = NULL)
##D ##round to 4 digits after decimal point
##D print(importance(cand.set = Cand.models, parm = "age", modnames = Modnames,
##D                  second.ord = TRUE, nobs = NULL), digits = 4)
##D detach(package:nlme)
## End(Not run)


##single-season occupancy model example modified from ?occu
## Not run: 
##D require(unmarked)
##D ##single season
##D data(frogs)
##D pferUMF <- unmarkedFrameOccu(pfer.bin)
##D ## add some fake covariates for illustration
##D siteCovs(pferUMF) <- data.frame(sitevar1 = rnorm(numSites(pferUMF)),
##D                                 sitevar2 = rnorm(numSites(pferUMF))) 
##D      
##D ## observation covariates are in site-major, observation-minor order
##D obsCovs(pferUMF) <- data.frame(obsvar1 = rnorm(numSites(pferUMF) *
##D                                  obsNum(pferUMF))) 
##D 
##D ##set up candidate model set
##D fm1 <- occu(~ obsvar1 ~ sitevar1, pferUMF)
##D fm2 <- occu(~ 1 ~ sitevar1, pferUMF)
##D fm3 <- occu(~ obsvar1 ~ sitevar2, pferUMF)
##D fm4 <- occu(~ 1 ~ sitevar2, pferUMF)
##D Cand.mods <- list(fm1, fm2, fm3, fm4)
##D Modnames <- c("fm1", "fm2", "fm3", "fm4")
##D 
##D ##compute importance value for 'sitevar1' on occupancy
##D importance(cand.set = Cand.mods, modnames = Modnames, parm = "sitevar1",
##D            parm.type = "psi")
##D ##compute importance value for 'obsvar1' on detectability
##D importance(cand.set = Cand.mods, modnames = Modnames, parm = "obsvar1",
##D            parm.type = "detect")
##D detach(package:unmarked)
## End(Not run)



