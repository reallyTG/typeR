library(AICcmodavg)


### Name: modavg
### Title: Compute Model-averaged Parameter Estimate (Multimodel Inference)
### Aliases: modavg modavg.default modavg.AICaov.lm modavg.AICbetareg
###   modavg.AICsclm.clm modavg.AICclm modavg.AICclmm modavg.AICcoxme
###   modavg.AICcoxph modavg.AICglm.lm modavg.AICgls modavg.AIChurdle
###   modavg.AIClm modavg.AIClme modavg.AIClmekin modavg.AICmaxlikeFit.list
###   modavg.AICmer modavg.AIClmerMod modavg.AICglmerMod
###   modavg.AICmultinom.nnet modavg.AICpolr modavg.AICrlm.lm
###   modavg.AICsurvreg modavg.AICvglm modavg.AICzeroinfl
###   modavg.AICunmarkedFitOccu modavg.AICunmarkedFitColExt
###   modavg.AICunmarkedFitOccuRN modavg.AICunmarkedFitPCount
###   modavg.AICunmarkedFitPCO modavg.AICunmarkedFitDS
###   modavg.AICunmarkedFitGDS modavg.AICunmarkedFitOccuFP
###   modavg.AICunmarkedFitMPois modavg.AICunmarkedFitGMM
###   modavg.AICunmarkedFitGPC print.modavg
### Keywords: models

### ** Examples

##anuran larvae example modified from Mazerolle (2006)
##these are different models than in the paper
data(min.trap)
##assign "UPLAND" as the reference level as in Mazerolle (2006)          
min.trap$Type <- relevel(min.trap$Type, ref = "UPLAND") 

##set up candidate models          
Cand.mod <- list( )
##global model          
Cand.mod[[1]] <- glm(Num_anura ~ Type + log.Perimeter +
                     Type:log.Perimeter + Num_ranatra,
                     family = poisson, offset = log(Effort),
                     data = min.trap)
##interactive model
Cand.mod[[2]] <- glm(Num_anura ~ Type + log.Perimeter +
                     Type:log.Perimeter, family = poisson, 
                     offset = log(Effort), data = min.trap)
##additive model
Cand.mod[[3]] <- glm(Num_anura ~ Type + log.Perimeter, family = poisson,
                     offset = log(Effort), data = min.trap)
##Predator model
Cand.mod[[4]] <- glm(Num_anura ~ Type + Num_ranatra, family = poisson,
                     offset = log(Effort), data = min.trap) 
          
##check c-hat for global model
c_hat(Cand.mod[[1]]) #uses Pearson's chi-square/df
##note the very low overdispersion: in this case, the analysis could be
##conducted without correcting for c-hat as its value is reasonably close
##to 1  

##assign names to each model
Modnames <- c("global model", "interactive model",
              "additive model", "invertpred model") 

##model selection
aictab(Cand.mod, Modnames)

##compute model-averaged estimates for parameters appearing in top
##models
modavg(parm = "Num_ranatra", cand.set = Cand.mod, modnames = Modnames)
##round to 4 digits after decimal point
print(modavg(parm = "Num_ranatra", cand.set = Cand.mod,
             modnames = Modnames), digits = 4)

##model-averaging a variable involved in an interaction
##the following produces an error - because the variable is involved
##in an interaction in some candidate models
## Not run: 
##D modavg(parm = "TypeBOG", cand.set = Cand.mod,
##D          modnames = Modnames)
## End(Not run)


##exclude models where the variable is involved in an interaction
##to get model-averaged estimate of main effect
modavg(parm = "TypeBOG", cand.set = Cand.mod, modnames = Modnames,
       exclude = list("Type:log.Perimeter"))

##to get model-averaged estimate of interaction
modavg(parm = "TypeBOG:log.Perimeter", cand.set = Cand.mod,
       modnames = Modnames)



##beware of variables that have similar names
set.seed(seed = 4)
resp <- rnorm(n = 40, mean = 3, sd = 1)
size <- rep(c("small", "medsmall", "high", "medhigh"), times = 10)
set.seed(seed = 4)
mass <- rnorm(n = 40, mean = 2, sd = 0.1)
mass2 <- mass^2
age <- rpois(n = 40, lambda = 3.2)
agecorr <- rpois(n = 40, lambda = 2) 
sizecat <- rep(c("a", "ab"), times = 20)
data1 <- data.frame(resp = resp, size = size, sizecat = sizecat,
                    mass = mass, mass2 = mass2, age = age,
                    agecorr = agecorr)

##set up models in list
Cand <- list( )
Cand[[1]] <- lm(resp ~ size + agecorr, data = data1)
Cand[[2]] <- lm(resp ~ size + mass + agecorr, data = data1)
Cand[[3]] <- lm(resp ~ age + mass, data = data1)
Cand[[4]] <- lm(resp ~ age + mass + mass2, data = data1)
Cand[[5]] <- lm(resp ~ mass + mass2 + size, data = data1)
Cand[[6]] <- lm(resp ~ mass + mass2 + sizecat, data = data1)
Cand[[7]] <- lm(resp ~ sizecat, data = data1)
Cand[[8]] <- lm(resp ~ sizecat + mass + sizecat:mass, data = data1)
Cand[[9]] <- lm(resp ~ agecorr + sizecat + mass + sizecat:mass,
                 data = data1) 

##create vector of model names
Modnames <- paste("mod", 1:length(Cand), sep = "")

aictab(cand.set = Cand, modnames = Modnames, sort = TRUE) #correct

##as expected, issues warning as mass occurs sometimes with "mass2" or
##"sizecatab:mass" in some of the models
## Not run: modavg(cand.set = Cand, parm = "mass", modnames = Modnames)

##no warning issued, because "age" and "agecorr" never appear in same model
modavg(cand.set = Cand, parm = "age", modnames = Modnames)

##as expected, issues warning because warn=FALSE, but it is a very bad
##idea in this example since "mass" occurs with "mass2" and "sizecat:mass"
##in some of the models - results are INCORRECT
## Not run: 
##D modavg(cand.set = Cand, parm = "mass", modnames = Modnames,
##D                 warn = FALSE)
## End(Not run)

##correctly excludes models with quadratic term and interaction term
##results are CORRECT
modavg(cand.set = Cand, parm = "mass", modnames = Modnames,
       exclude = list("mass2", "sizecat:mass")) 

##correctly computes model-averaged estimate because no other parameter
##occurs simultaneously in any of the models
modavg(cand.set = Cand, parm = "sizesmall", modnames = Modnames) #correct

##as expected, issues a warning because "sizecatab" occurs sometimes in
##an interaction in some models
## Not run: 
##D modavg(cand.set = Cand, parm = "sizecatab",
##D                 modnames = Modnames) 
## End(Not run)

##exclude models with "sizecat:mass" interaction - results are CORRECT
modavg(cand.set = Cand, parm = "sizecatab", modnames = Modnames,
       exclude = list("sizecat:mass"))



##example with multiple-season occupancy model modified from ?colext
##this is a bit longer
## Not run: 
##D require(unmarked)
##D data(frogs)
##D umf <- formatMult(masspcru)
##D obsCovs(umf) <- scale(obsCovs(umf))
##D siteCovs(umf) <- rnorm(numSites(umf))
##D yearlySiteCovs(umf) <- data.frame(year = factor(rep(1:7,
##D                                     numSites(umf))))
##D 
##D ##set up model with constant transition rates
##D fm <- colext(psiformula = ~ 1, gammaformula = ~ 1, epsilonformula = ~ 1,
##D              pformula = ~ JulianDate + I(JulianDate^2), data = umf,
##D              control = list(trace=1, maxit=1e4))
##D 
##D ##model with with year-dependent transition rates
##D fm.yearly <- colext(psiformula = ~ 1, gammaformula = ~ year,
##D                     epsilonformula = ~ year,
##D                     pformula = ~ JulianDate + I(JulianDate^2),
##D                     data = umf)
##D 
##D ##store in list and assign model names
##D Cand.mods <- list(fm, fm.yearly)
##D Modnames <- c("psi1(.)gam(.)eps(.)p(Date + Date2)",
##D               "psi1(.)gam(Year)eps(Year)p(Date + Date2)")
##D 
##D ##compute model-averaged estimate of occupancy in the first year
##D modavg(cand.set = Cand.mods, modnames = Modnames, parm = "(Intercept)",
##D        parm.type = "psi")
##D 
##D ##compute model-averaged estimate of Julian Day squared on detectability
##D modavg(cand.set = Cand.mods, modnames = Modnames,
##D        parm = "I(JulianDate^2)", parm.type = "detect")
## End(Not run)


##example of model-averaged estimate of area from distance model
##this is a bit longer
## Not run: 
##D data(linetran) #example modified from ?distsamp
##D      
##D ltUMF <- with(linetran, {
##D   unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
##D                   siteCovs = data.frame(Length, area, habitat),
##D                   dist.breaks = c(0, 5, 10, 15, 20),
##D                   tlength = linetran$Length * 1000, survey = "line", unitsIn = "m")
##D })
##D      
##D ## Half-normal detection function. Density output (log scale). No covariates.
##D fm1 <- distsamp(~ 1 ~ 1, ltUMF)
##D      
##D ## Halfnormal. Covariates affecting both density and detection.
##D fm2 <- distsamp(~ area + habitat ~ area + habitat, ltUMF)
##D 
##D ## Hazard function. Covariates affecting both density and detection.
##D fm3 <- distsamp(~ habitat ~ area + habitat, ltUMF, keyfun="hazard")
##D 
##D ##assemble model list
##D Cands <- list(fm1, fm2, fm3)
##D Modnames <- paste("mod", 1:length(Cands), sep = "")
##D 
##D ##model-average estimate of area on abundance
##D modavg(cand.set = Cands, modnames = Modnames, parm = "area", parm.type = "lambda")
##D detach(package:unmarked)
## End(Not run)



