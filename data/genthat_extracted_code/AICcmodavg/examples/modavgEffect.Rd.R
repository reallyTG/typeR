library(AICcmodavg)


### Name: modavgEffect
### Title: Compute Model-averaged Effect Sizes (Multimodel Inference on
###   Group Differences)
### Aliases: modavgEffect modavgEffect.default modavgEffect.AICaov.lm
###   modavgEffect.AICglm.lm modavgEffect.AICgls modavgEffect.AIClm
###   modavgEffect.AIClme modavgEffect.AICmer modavgEffect.AICglmerMod
###   modavgEffect.AIClmerMod modavgEffect.AICrlm.lm
###   modavgEffect.AICsurvreg modavgEffect.AICunmarkedFitOccu
###   modavgEffect.AICunmarkedFitColExt modavgEffect.AICunmarkedFitOccuRN
###   modavgEffect.AICunmarkedFitPCount modavgEffect.AICunmarkedFitPCO
###   modavgEffect.AICunmarkedFitDS modavgEffect.AICunmarkedFitGDS
###   modavgEffect.AICunmarkedFitOccuFP modavgEffect.AICunmarkedFitMPois
###   modavgEffect.AICunmarkedFitGMM modavgEffect.AICunmarkedFitGPC
###   print.modavgEffect
### Keywords: models

### ** Examples

##heights (cm) of plants grown under two fertilizers, Ex. 9.5 from
##Zar (1984): Biostatistical Analysis. Prentice Hall: New Jersey.
heights <- data.frame(Height = c(48.2, 54.6, 58.3, 47.8, 51.4, 52.0,
                        55.2, 49.1, 49.9, 52.6, 52.3, 57.4, 55.6, 53.2,
                        61.3, 58.0, 59.8, 54.8),
                      Fertilizer = c(rep("old", 10), rep("new", 8)))

##run linear model hypothesizing an effect of fertilizer
m1 <- lm(Height ~ Fertilizer, data = heights)

##run null model (no effect of fertilizer)
m0 <- lm(Height ~ 1, data = heights)

##assemble models in list
Cands <- list(m1, m0)
Modnames <- c("Fert", "null")

##compute model selection table to compare
##both hypotheses
aictab(cand.set = Cands, modnames = Modnames)
##note that model with fertilizer effect is much better supported
##than the null

##compute model-averaged effect sizes: one model hypothesizes a
##difference of 0, whereas the other assumes a difference

##prepare newdata object from which differences between groups
##will be computed
##the first row of the newdata data.frame relates to the first group,
##whereas the second row corresponds to the second group
pred.data <- data.frame(Fertilizer = c("new", "old"))

##compute best estimate of effect size accounting for model selection
##uncertainty
modavgEffect(cand.set = Cands, modnames = Modnames,
              newdata = pred.data)


##classical one-way ANOVA type-design
## Not run: 
##D ##generate data for two groups and control
##D set.seed(seed = 15)
##D y <- round(c(rnorm(n = 15, mean = 10, sd = 5),
##D        rnorm(n = 15, mean = 15, sd = 5),
##D        rnorm(n = 15, mean = 12, sd = 5)), digits = 2)
##D ##groups
##D group <- c(rep("cont", 15), rep("trt1", 15), rep("trt2", 15))
##D 
##D ##combine in data set
##D aov.data <- data.frame(Y = y, Group = group)
##D rm(y, group)
##D 
##D ##run model with group effect
##D lm.eff <- lm(Y ~ Group, data = aov.data)
##D ##null model
##D lm.0 <- lm(Y ~ 1, data = aov.data)
##D 
##D ##compare both models
##D Cands <- list(lm.eff, lm.0)
##D Mods <- c("group effect", "no group effect")
##D aictab(cand.set = Cands, modnames = Mods)
##D ##model with group effect has most of the weight
##D 
##D ##compute model-averaged effect sizes
##D ##trt1 - control
##D modavgEffect(cand.set = Cands, modnames = Modnames,
##D               newdata = data.frame(Group = c("trt1", "cont")))
##D ##trt1 differs from cont
##D 
##D ##trt2 - control
##D modavgEffect(cand.set = Cands, modnames = Modnames,
##D               newdata = data.frame(Group = c("trt2", "cont")))
##D ##trt2 does not differ from cont
## End(Not run)


##two-way ANOVA type design, Ex. 13.1 (Zar 1984) of plasma calcium
##concentration (mg/100 ml) in birds as a function of sex and hormone
##treatment
## Not run: 
##D birds <- data.frame(Ca = c(16.87, 16.18, 17.12, 16.83, 17.19, 15.86,
##D                       14.92, 15.63, 15.24, 14.8, 19.07, 18.77, 17.63,
##D                       16.99, 18.04, 17.2, 17.64, 17.89, 16.78, 16.92,
##D                       32.45, 28.71, 34.65, 28.79, 24.46, 30.54, 32.41,
##D                       28.97, 28.46, 29.65),
##D                     Sex = c("M", "M", "M", "M", "M", "F", "F", "F", "F",
##D                       "F", "M", "M", "M", "M", "M", "F", "F", "F", "F",
##D                       "F", "M", "M", "M", "M", "M", "F", "F", "F", "F",
##D                       "F"),
##D                     Hormone = as.factor(c(1, 1, 1, 1, 1, 1, 1, 1, 1,
##D                       1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3,
##D                       3, 3, 3, 3, 3)))
##D 
##D ##candidate models
##D ##interactive effects
##D m.inter <- lm(Ca ~ Sex + Hormone + Sex:Hormone, data = birds)
##D 
##D ##additive effects
##D m.add <- lm(Ca ~ Sex + Hormone, data = birds)
##D 
##D ##Sex only
##D m.sex <- lm(Ca ~ Sex, data = birds)
##D 
##D ##Hormone only
##D m.horm <- lm(Ca ~ Hormone, data = birds)
##D 
##D ##null
##D m.0 <- lm(Ca ~ 1, data = birds)
##D 
##D ##model selection
##D Cands <- list(m.inter, m.add, m.sex, m.horm, m.0)
##D Mods <- c("interaction", "additive", "sex only", "horm only", "null")
##D aictab(Cands, Mods)
##D ##there is some support for a hormone only treatment, but also for
##D ##additive effects
##D 
##D ##compute model-averaged effects of sex, and set the other variable
##D ##to a constant value
##D ##M - F
##D sex.data <- data.frame(Sex = c("M", "F"), Hormone = c("1", "1"))
##D modavgEffect(Cands, Mods, newdata = sex.data)
##D ##no support for a sex main effect
##D 
##D ##hormone 1 - 3, but set Sex to a constant value
##D horm1.data <- data.frame(Sex = c("M", "M"), Hormone = c("1", "3"))
##D modavgEffect(Cands, Mods, newdata = horm1.data)
##D 
##D ##hormone 2 - 3, but set Sex to a constant value
##D horm2.data <- data.frame(Sex = c("M", "M"), Hormone = c("2", "3"))
##D modavgEffect(Cands, Mods, newdata = horm2.data)
## End(Not run)


##Poisson regression with anuran larvae example from Mazerolle (2006)
## Not run: 
##D data(min.trap)
##D ##assign "UPLAND" as the reference level as in Mazerolle (2006)          
##D min.trap$Type <- relevel(min.trap$Type, ref = "UPLAND") 
##D 
##D ##set up candidate models          
##D Cand.mod <- list( )
##D ##global model          
##D Cand.mod[[1]] <- glm(Num_anura ~ Type + log.Perimeter,
##D                      family = poisson, offset = log(Effort),
##D                      data = min.trap) 
##D Cand.mod[[2]] <- glm(Num_anura ~ log.Perimeter, family = poisson,
##D                      offset = log(Effort), data = min.trap) 
##D Cand.mod[[3]] <- glm(Num_anura ~ Type, family = poisson,
##D                      offset = log(Effort), data = min.trap) 
##D Cand.mod[[4]] <- glm(Num_anura ~ 1, family = poisson,
##D                      offset = log(Effort), data = min.trap) 
##D           
##D ##check c-hat for global model
##D vif.hat <- c_hat(Cand.mod[[1]]) #uses Pearson's chi-square/df
##D 
##D ##assign names to each model
##D Modnames <- c("type + logperim", "type", "logperim", "intercept only") 
##D 
##D ##compute model-averaged estimate of difference between abundance at bog
##D ##pond and upland pond
##D ##create newdata object to make predictions
##D pred.data <- data.frame(Type = c("BOG", "UPLAND"),
##D                         log.Perimeter = mean(min.trap$log.Perimeter),
##D                         Effort = mean(min.trap$Effort))
##D modavgEffect(Cand.mod, Modnames, newdata = pred.data, c.hat = vif.hat,
##D              type = "response")
##D ##little suport for a pond type effect
## End(Not run)


##mixed linear model example from ?nlme
## Not run: 
##D library(nlme)
##D Cand.models <- list( )
##D Cand.models[[1]] <- lme(distance ~ age, data = Orthodont, method="ML")
##D Cand.models[[2]] <- lme(distance ~ age + Sex, data = Orthodont,
##D                         random = ~ 1, method="ML")
##D Cand.models[[3]] <-lme(distance ~ 1, data = Orthodont, random = ~ 1,
##D                        method="ML")
##D Cand.models[[4]] <-lme(distance ~ Sex, data = Orthodont, random = ~ 1,
##D                        method="ML")
##D 
##D Modnames <- c("age", "age + sex", "null", "sex")
##D 
##D data.other <- data.frame(age = mean(Orthodont$age),
##D                          Sex = factor(c("Male", "Female"))) 
##D modavgEffect(cand.set = Cand.models, modnames = Modnames,
##D              newdata = data.other, conf.level = 0.95, second.ord = TRUE,
##D              nobs = NULL, uncond.se = "revised")
##D detach(package:nlme)
## End(Not run)


##site occupancy analysis example
## Not run: 
##D library(unmarked)
##D ##single season model
##D data(frogs)
##D pferUMF <- unmarkedFrameOccu(pfer.bin)
##D ##create a bogus site group
##D site.group <- c(rep(1, times = nrow(pfer.bin)/2), rep(0, nrow(pfer.bin)/2))
##D 
##D ## add some fake covariates for illustration
##D siteCovs(pferUMF) <- data.frame(site.group, sitevar1 =
##D                                 rnorm(numSites(pferUMF)),
##D                                 sitevar2 = runif(numSites(pferUMF)))
##D      
##D ## observation covariates are in site-major, observation-minor order
##D obsCovs(pferUMF) <- data.frame(obsvar1 =
##D                                rnorm(numSites(pferUMF) * obsNum(pferUMF)))
##D      
##D fm1 <- occu(~ obsvar1 ~ site.group, pferUMF)
##D fm2 <- occu(~ obsvar1 ~ 1, pferUMF)
##D 
##D Cand.mods <- list(fm1, fm2)
##D Modnames <- c("fm1", "fm2")
##D 
##D ##model selection table
##D aictab(cand.set = Cand.mods, modnames = Modnames, second.ord = TRUE)
##D 
##D ##model-averaged effect sizes comparing site.group 1 - site.group 0
##D newer.dat <- data.frame(site.group = c(0, 1))
##D 
##D modavgEffect(cand.set = Cand.mods, modnames = Modnames, type = "response",
##D               second.ord = TRUE, newdata = newer.dat, parm.type = "psi")
##D ##no support for an effect of site group
## End(Not run)


##single season N-mixture models
## Not run: 
##D data(mallard)
##D ##this variable was created to illustrate the use of modavgEffect
##D ##with detection variables
##D mallard.site$site.group <- c(rep(1, 119), rep(0, 120))
##D mallardUMF <- unmarkedFramePCount(mallard.y, siteCovs = mallard.site,
##D                                   obsCovs = mallard.obs)
##D siteCovs(mallardUMF)
##D tmp.covs <- obsCovs(mallardUMF)
##D obsCovs(mallardUMF)$date2 <- tmp.covs$date^2
##D (fm.mall <- pcount(~ site.group ~ length + elev + forest, mallardUMF, K=30))
##D (fm.mallb <- pcount(~ 1 ~ length + elev + forest, mallardUMF, K=30))
##D      
##D Cands <- list(fm.mall, fm.mallb)
##D Modnames <- c("one", "null")
##D 
##D ##model averaged effect size of site.group 1 - site.group 0 on response
##D ##scale (point estimate)
##D modavgEffect(Cands, Modnames, newdata = data.frame(site.group = c(0, 1)),
##D               parm.type = "detect", type = "response")
##D 
##D ##model averaged effect size of site.group 1 - site.group 0 on link
##D ##scale (here, logit link)
##D modavgEffect(Cands, Modnames, newdata = data.frame(site.group = c(0, 1)),
##D               parm.type = "detect", type = "link")
##D 
##D detach(package:unmarked)
## End(Not run)



