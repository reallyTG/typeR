library(AICcmodavg)


### Name: modavgShrink
### Title: Compute Model-averaged Parameter Estimate with Shrinkage
###   (Multimodel Inference)
### Aliases: modavgShrink modavgShrink.default modavgShrink.AICaov.lm
###   modavgShrink.AICbetareg modavgShrink.AICsclm.clm modavgShrink.AICclm
###   modavgShrink.AICclmm modavgShrink.AICcoxme modavgShrink.AICcoxph
###   modavgShrink.AICglm.lm modavgShrink.AICgls modavgShrink.AIChurdle
###   modavgShrink.AIClm modavgShrink.AIClme modavgShrink.AIClmekin
###   modavgShrink.AICmaxlikeFit.list modavgShrink.AICmer
###   modavgShrink.AICglmerMod modavgShrink.AIClmerMod
###   modavgShrink.AICmultinom.nnet modavgShrink.AICpolr
###   modavgShrink.AICrlm.lm modavgShrink.AICsurvreg modavgShrink.AICvglm
###   modavgShrink.AICzeroinfl modavgShrink.AICunmarkedFitOccu
###   modavgShrink.AICunmarkedFitColExt modavgShrink.AICunmarkedFitOccuRN
###   modavgShrink.AICunmarkedFitPCount modavgShrink.AICunmarkedFitPCO
###   modavgShrink.AICunmarkedFitDS modavgShrink.AICunmarkedFitGDS
###   modavgShrink.AICunmarkedFitOccuFP modavgShrink.AICunmarkedFitMPois
###   modavgShrink.AICunmarkedFitGMM modavgShrink.AICunmarkedFitGPC
###   print.modavgShrink
### Keywords: models

### ** Examples

##cement example in Burnham and Anderson 2002
data(cement)
##setup same model set as in Table 3.2, p. 102         
Cand.models <- list( )
Cand.models[[1]] <- lm(y ~ x1 + x2, data = cement)
Cand.models[[2]] <- lm(y ~ x1 + x2 + x4, data = cement)          
Cand.models[[3]] <- lm(y ~ x1 + x2 + x3, data = cement)
Cand.models[[4]] <- lm(y ~ x1 + x4, data = cement)
Cand.models[[5]] <- lm(y ~ x1 + x3 + x4, data = cement)
Cand.models[[6]] <- lm(y ~ x2 + x3 + x4, data = cement)
Cand.models[[7]] <- lm(y ~ x1 + x2 + x3 + x4, data = cement)
Cand.models[[8]] <- lm(y ~ x3 + x4, data = cement)
Cand.models[[9]] <- lm(y ~ x2 + x3, data = cement)
Cand.models[[10]] <- lm(y ~ x4, data = cement)
Cand.models[[11]] <- lm(y ~ x2, data = cement)
Cand.models[[12]] <- lm(y ~ x2 + x4, data = cement)
Cand.models[[13]] <- lm(y ~ x1, data = cement)
Cand.models[[14]] <- lm(y ~ x1 + x3, data = cement)
Cand.models[[15]] <- lm(y ~ x3, data = cement)

##vector of model names
Modnames <- paste("mod", 1:15, sep="")

##AICc          
aictab(cand.set = Cand.models, modnames = Modnames)

##compute model-averaged estimate with shrinkage - each parameter
##appears 8 times in the models 
modavgShrink(cand.set = Cand.models, modnames = Modnames, parm = "x1")

##compare against classic model-averaging
modavg(cand.set = Cand.models, modnames = Modnames, parm = "x1")
##note that model-averaged estimate with shrinkage is closer to 0 than
##with the classic version

##remove a few models from the set and run again
Cand.unbalanced <- Cand.models[-c(3, 14, 15)]

##set up model names
Modnames <- paste("mod", 1:length(Cand.unbalanced), sep="")

##issues an error because some parameters appear more often than others
## Not run: 
##D modavgShrink(cand.set = Cand.unbalanced,
##D                        modnames = Modnames, parm = "x1")
## End(Not run)



##example on Orthodont data set in nlme
## Not run: 
##D require(nlme)
##D 
##D ##set up candidate model list
##D ##age and sex parameters appear in the same number of models
##D ##same number of models with and without these parameters
##D Cand.models <- list( )
##D Cand.models[[1]] <- lme(distance ~ age, data = Orthodont, method = "ML") 
##D ##random is ~ age | Subject as it is a grouped data frame
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
##D ##compute importance values for age
##D imp.age <- importance(cand.set = Cand.models, parm = "age",
##D                       modnames = Modnames, second.ord = TRUE,
##D                       nobs = NULL)
##D 
##D ##compute shrinkage version of model averaging on age
##D mod.avg.age.shrink <- modavgShrink(cand.set = Cand.models,
##D                                     parm = "age", modnames = Modnames,
##D                                     second.ord = TRUE, nobs = NULL)
##D 
##D ##compute classic version of model averaging on age
##D mod.avg.age.classic <- modavg(cand.set = Cand.models, parm = "age",
##D                               modnames = Modnames, second.ord = TRUE,
##D                               nobs = NULL)
##D 
##D ##correspondence between shrinkage version and classic version of
##D ##model averaging 
##D mod.avg.age.shrink$Mod.avg.beta/imp.age$w.plus
##D mod.avg.age.classic$Mod.avg.beta
##D detach(package:nlme)
## End(Not run)


##example of N-mixture model modified from ?pcount
## Not run: 
##D require(unmarked)
##D data(mallard)
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D                                   obsCovs = mallard.obs)
##D ##set up models so that each variable on abundance appears twice
##D fm.mall.one <- pcount(~ ivel + date  ~ length + forest, mallardUMF,
##D                       K = 30)
##D fm.mall.two <- pcount(~ ivel + date  ~ elev + forest, mallardUMF,
##D                       K = 30)
##D fm.mall.three <- pcount(~ ivel + date  ~ length + elev, mallardUMF,
##D                         K = 30)
##D 
##D ##model list and names
##D Cands <- list(fm.mall.one, fm.mall.two, fm.mall.three)
##D Modnames <- c("length + forest", "elev + forest", "length + elev")
##D 
##D ##compute model-averaged estimate with shrinkage for elev on abundance
##D modavgShrink(cand.set = Cands, modnames = Modnames, parm = "elev",
##D               parm.type = "lambda")
##D detach(package:unmarked)
## End(Not run)



