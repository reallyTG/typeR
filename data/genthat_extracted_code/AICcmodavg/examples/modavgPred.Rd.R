library(AICcmodavg)


### Name: modavgPred
### Title: Compute Model-averaged Predictions
### Aliases: modavgPred modavgPred.default modavgPred.AICaov.lm
###   modavgPred.AICglm.lm modavgPred.AICgls modavgPred.AIClm
###   modavgPred.AIClme modavgPred.AICglmerMod modavgPred.AIClmerMod
###   modavgPred.AICmer modavgPred.AICrlm.lm modavgPred.AICsurvreg
###   modavgPred.AICunmarkedFitOccu modavgPred.AICunmarkedFitColExt
###   modavgPred.AICunmarkedFitOccuRN modavgPred.AICunmarkedFitPCount
###   modavgPred.AICunmarkedFitPCO modavgPred.AICunmarkedFitDS
###   modavgPred.AICunmarkedFitGDS modavgPred.AICunmarkedFitOccuFP
###   modavgPred.AICunmarkedFitMPois modavgPred.AICunmarkedFitGMM
###   modavgPred.AICunmarkedFitGPC print.modavgPred
### Keywords: models

### ** Examples

##example from subset of models in Table 1 in Mazerolle (2006)
data(dry.frog)

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
Cand.models[[4]] <- lm(log_Mass_lost ~ Shade + cent_Initial_mass +
                       Initial_mass2, data = dry.frog)
Cand.models[[5]] <- lm(log_Mass_lost ~ Substrate + cent_Initial_mass +
                       Initial_mass2, data = dry.frog)

##setup model names
Modnames <- paste("mod", 1:length(Cand.models), sep = "")

##compute model-averaged value and unconditional SE of predicted log of
##mass lost for frogs of average mass in shade for each substrate type

##first create data set to use for predictions
new.dat <- data.frame(Shade = c(1, 1, 1),
                      cent_Initial_mass = c(0, 0, 0),
                      Initial_mass2 = c(0, 0, 0),
                      Substrate = c("SOIL", "SPHAGNUM", "PEAT")) 

##compare unconditional SE's using both methods
modavgPred(cand.set = Cand.models, modnames = Modnames,
           newdata = new.dat, type = "response", uncond.se = "old")
modavgPred(cand.set = Cand.models, modnames = Modnames,
           newdata = new.dat, type = "response", uncond.se = "revised")
##round to 4 digits after decimal point
print(modavgPred(cand.set = Cand.models, modnames = Modnames,
                 newdata = new.dat, type = "response",
                 uncond.se = "revised"), digits = 4)



##Gamma glm
## Not run: 
##D ##clotting data example from 'gamma.shape' in MASS package of
##D ##Venables and Ripley (2002, Modern applied statistics with
##D ##S. Springer-Verlag: New York.)
##D clotting <- data.frame(u = c(5, 10, 15, 20, 30, 40, 60, 80, 100),
##D                        lot1 = c(118, 58, 42, 35, 27, 25, 21, 19, 18),
##D                        lot2 = c(69, 35, 26, 21, 18, 16, 13, 12, 12))
##D clot1 <- glm(lot1 ~ log(u), data = clotting, family = Gamma)
##D 
##D require(MASS)
##D gamma.dispersion(clot1) #dispersion parameter
##D gamma.shape(clot1) #reciprocal of dispersion parameter ==
##D ##shape parameter 
##D summary(clot1, dispersion = gamma.dispersion(clot1))  #better
##D 
##D ##create list with models
##D Cand <- list( )
##D Cand[[1]] <- glm(lot1 ~ log(u), data = clotting, family = Gamma)
##D Cand[[2]] <- glm(lot1 ~ 1, data = clotting, family = Gamma)
##D 
##D ##create vector of model names
##D Modnames <- paste("mod", 1:length(Cand), sep = "")
##D 
##D ##compute model-averaged predictions on scale of response variable for
##D ##all observations
##D modavgPred(cand.set = Cand, modnames = Modnames, newdata = clotting,
##D            gamdisp = gamma.dispersion(clot1), type = "response") 
##D 
##D ##compute model-averaged predictions on scale of linear predictor
##D modavgPred(cand.set = Cand, modnames = Modnames, newdata = clotting,
##D            gamdisp = gamma.dispersion(clot1), type = "link")
##D 
##D ##compute model-averaged predictions on scale of linear predictor
##D modavgPred(cand.set = Cand, modnames = Modnames, newdata = clotting,
##D            gamdisp = gamma.dispersion(clot1), type = "terms") #returns an error
##D ##because type = "terms" is not defined for 'modavgPred'
##D 
##D modavgPred(cand.set = Cand, modnames = Modnames, newdata = clotting,
##D            type = "terms") #returns an error because
##D ##no gamma dispersion parameter was specified (i.e., 'gamdisp' missing) 
## End(Not run)


##example of model-averaged predictions from N-mixture model
##each variable appears twice in the models - this is a bit longer
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
##D fm.mall.four <- pcount(~ ivel + date  ~ 1, mallardUMF, K = 30)
##D 
##D ##model list
##D Cands <- list(fm.mall.one, fm.mall.two, fm.mall.three, fm.mall.four)
##D Modnames <- c("length + forest", "elev + forest", "length + elev",
##D               "null")
##D 
##D ##compute model-averaged predictions of abundance for values of elev
##D modavgPred(cand.set = Cands, modnames = Modnames, newdata =
##D            data.frame(elev = seq(from = -1.4, to = 2.4, by = 0.1),
##D                       length = 0, forest = 0), parm.type = "lambda",
##D            type = "response")
##D 
##D ##compute model-averaged predictions of detection for values of ivel
##D modavgPred(cand.set = Cands, modnames = Modnames, newdata =
##D            data.frame(ivel = seq(from = -1.75, to = 5.9, by = 0.5),
##D                       date = 0), parm.type = "detect",
##D            type = "response")
##D detach(package:unmarked)
## End(Not run)


##example of model-averaged abundance from distance model
## Not run: 
##D ##this is a bit longer
##D data(linetran) #example from ?distsamp
##D      
##D ltUMF <- with(linetran, {
##D   unmarkedFrameDS(y = cbind(dc1, dc2, dc3, dc4),
##D                   siteCovs = data.frame(Length, area, habitat),
##D                   dist.breaks = c(0, 5, 10, 15, 20),
##D                   tlength = linetran$Length * 1000, survey = "line",
##D                   unitsIn = "m")
##D })
##D      
##D ## Half-normal detection function. Density output (log scale). No covariates.
##D fm1 <- distsamp(~ 1 ~ 1, ltUMF)
##D      
##D ## Halfnormal. Covariates affecting both density and and detection.
##D fm2 <- distsamp(~area + habitat ~ habitat, ltUMF)
##D 
##D ## Hazard function. Covariates affecting both density and and detection.
##D fm3 <- distsamp(~area + habitat ~ habitat, ltUMF, keyfun="hazard")
##D 
##D ##assemble model list
##D Cands <- list(fm1, fm2, fm3)
##D Modnames <- paste("mod", 1:length(Cands), sep = "")
##D 
##D ##model-average predictions on abundance
##D modavgPred(cand.set = Cands, modnames = Modnames, parm.type = "lambda", type = "link",
##D            newdata = data.frame(area = mean(linetran$area), habitat = c("A", "B")))
##D detach(package:unmarked)
## End(Not run)



##example using Orthodont data set from Pinheiro and Bates (2000)
## Not run: 
##D require(nlme)
##D 
##D ##set up candidate models
##D m1 <- gls(distance ~ age, correlation = corCompSymm(value = 0.5, form = ~ 1 | Subject),
##D           data = Orthodont, method = "ML")
##D 
##D m2 <- gls(distance ~ 1, correlation = corCompSymm(value = 0.5, form = ~ 1 | Subject),
##D           data = Orthodont, method = "ML")
##D 
##D ##assemble in list
##D Cand.models <- list(m1, m2)
##D ##model names
##D Modnames <- c("age effect", "null model")
##D 
##D ##model selection table
##D aictab(cand.set = Cand.models, modnames = Modnames)
##D 
##D ##model-averaged predictions
##D modavgPred(cand.set = Cand.models, modnames = Modnames, newdata =
##D data.frame(age = c(8, 10, 12, 14)))
##D detach(package:nlme)
## End(Not run)



