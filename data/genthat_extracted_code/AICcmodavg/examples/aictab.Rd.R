library(AICcmodavg)


### Name: aictab
### Title: Create Model Selection Tables
### Aliases: aictab aictab.default aictab.AICaov.lm aictab.AICbetareg
###   aictab.AICsclm.clm aictab.AICclm aictab.AICclmm aictab.AICcoxme
###   aictab.AICcoxph aictab.AICfitdist aictab.AICfitdistr aictab.AICglm.lm
###   aictab.AICgls aictab.AICgnls.gls aictab.AIChurdle aictab.AIClavaan
###   aictab.AIClm aictab.AIClme aictab.AIClmekin aictab.AICmaxlikeFit.list
###   aictab.AICmer aictab.AIClmerMod aictab.AICglmerMod aictab.AICnlmerMod
###   aictab.AICmultinom.nnet aictab.AICnlme.lme aictab.AICnls
###   aictab.AICpolr aictab.AICrlm.lm aictab.AICsurvreg
###   aictab.AICunmarkedFitOccu aictab.AICunmarkedFitColExt
###   aictab.AICunmarkedFitOccuRN aictab.AICunmarkedFitPCount
###   aictab.AICunmarkedFitPCO aictab.AICunmarkedFitDS
###   aictab.AICunmarkedFitGDS aictab.AICunmarkedFitOccuFP
###   aictab.AICunmarkedFitMPois aictab.AICunmarkedFitGMM
###   aictab.AICunmarkedFitGPC aictab.AICvglm aictab.AICzeroinfl
###   print.aictab
### Keywords: models

### ** Examples

##Mazerolle (2006) frog water loss example
data(dry.frog)

##setup a subset of models of Table 1
Cand.models <- list( )
Cand.models[[1]] <- lm(log_Mass_lost ~ Shade + Substrate +
                       cent_Initial_mass + Initial_mass2,
                       data = dry.frog)
Cand.models[[2]] <- lm(log_Mass_lost ~ Shade + Substrate +
                       cent_Initial_mass + Initial_mass2 +
                       Shade:Substrate, data = dry.frog)
Cand.models[[3]] <- lm(log_Mass_lost ~ cent_Initial_mass +
                       Initial_mass2, data = dry.frog)
Cand.models[[4]] <- lm(log_Mass_lost ~ Shade + cent_Initial_mass +
                       Initial_mass2, data = dry.frog)
Cand.models[[5]] <- lm(log_Mass_lost ~ Substrate + cent_Initial_mass +
                       Initial_mass2, data = dry.frog)

##create a vector of names to trace back models in set
Modnames <- paste("mod", 1:length(Cand.models), sep = " ")

##generate AICc table
aictab(cand.set = Cand.models, modnames = Modnames, sort = TRUE)
##round to 4 digits after decimal point and give log-likelihood
print(aictab(cand.set = Cand.models, modnames = Modnames, sort = TRUE),
      digits = 4, LL = TRUE)



## Not run: 
##D ##Burnham and Anderson (2002) flour beetle data
##D data(beetle)
##D ##models as suggested by Burnham and Anderson p. 198          
##D Cand.set <- list( )
##D Cand.set[[1]] <- glm(Mortality_rate ~ Dose, family =
##D                      binomial(link = "logit"), weights = Number_tested,
##D                      data = beetle)
##D Cand.set[[2]] <- glm(Mortality_rate ~ Dose, family =
##D                      binomial(link = "probit"), weights = Number_tested,
##D                      data = beetle)
##D Cand.set[[3]] <- glm(Mortality_rate ~ Dose, family =
##D                      binomial(link ="cloglog"), weights = Number_tested,
##D                      data = beetle)
##D 
##D ##check c-hat
##D c_hat(Cand.set[[1]])
##D c_hat(Cand.set[[2]])
##D c_hat(Cand.set[[3]])
##D ##lowest value of c-hat < 1 for these non-nested models, thus use
##D ##c.hat = 1 
##D        
##D ##set up named list
##D names(Cand.set) <- c("logit", "probit", "cloglog")
##D 
##D ##compare models
##D ##model names will be taken from the list if modnames is not specified
##D res.table <- aictab(cand.set = Cand.set, second.ord = FALSE)
##D ##note that delta AIC and Akaike weights are identical to Table 4.7
##D print(res.table, digits = 2, LL = TRUE) #print table with 2 digits and
##D ##print log-likelihood in table
##D print(res.table, digits = 4, LL = FALSE) #print table with 4 digits and
##D ##do not print log-likelihood
## End(Not run)


##two-way ANOVA with interaction
data(iron)
##full model
m1 <- lm(Iron ~ Pot + Food + Pot:Food, data = iron)
##additive model
m2 <- lm(Iron ~ Pot + Food, data = iron)
##null model
m3 <- lm(Iron ~ 1, data = iron)

##candidate models
Cand.aov <- list(m1, m2, m3)
Cand.names <- c("full", "additive", "null")
aictab(Cand.aov, Cand.names)



##single-season occupancy model example modified from ?occu
## Not run: 
##D require(unmarked)
##D ##single season example modified from ?occu
##D data(frogs)
##D pferUMF <- unmarkedFrameOccu(pfer.bin)
##D ##add fake covariates
##D siteCovs(pferUMF) <- data.frame(sitevar1 = rnorm(numSites(pferUMF)),
##D                                 sitevar2 = runif(numSites(pferUMF))) 
##D      
##D ##observation covariates
##D obsCovs(pferUMF) <- data.frame(obsvar1 = rnorm(numSites(pferUMF) *
##D                                  obsNum(pferUMF))) 
##D 
##D ##set up candidate model set
##D fm1 <- occu(~ obsvar1 ~ sitevar1, pferUMF)
##D fm2 <- occu(~ 1 ~ sitevar1, pferUMF)
##D fm3 <- occu(~ obsvar1 ~ sitevar2, pferUMF)
##D fm4 <- occu(~ 1 ~ sitevar2, pferUMF)
##D 
##D ##assemble models in named list (alternative to using 'modnames' argument)
##D Cand.mods <- list("fm1" = fm1, "fm2" = fm2, "fm3" = fm3, "fm4" = fm4)
##D 
##D ##compute table
##D aictab(cand.set = Cand.mods, second.ord = TRUE)
##D 
##D detach(package:unmarked)
## End(Not run)



