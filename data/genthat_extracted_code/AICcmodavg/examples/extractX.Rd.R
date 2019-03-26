library(AICcmodavg)


### Name: extractX
### Title: Extract Predictors from Candidate Model List
### Aliases: extractX extractX.default extractX.AICaov.lm
###   extractX.AICglm.lm extractX.AICgls extractX.AIClm extractX.AIClme
###   extractX.AICglmerMod extractX.AIClmerMod extractX.AICrlm.lm
###   extractX.AICsurvreg extractX.AICunmarkedFitOccu
###   extractX.AICunmarkedFitColExt extractX.AICunmarkedFitOccuRN
###   extractX.AICunmarkedFitPCount extractX.AICunmarkedFitPCO
###   extractX.AICunmarkedFitDS extractX.AICunmarkedFitGDS
###   extractX.AICunmarkedFitOccuFP extractX.AICunmarkedFitMPois
###   extractX.AICunmarkedFitGMM extractX.AICunmarkedFitGPC print.extractX
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
##assign names
names(Cand.models) <- paste(1:length(Cand.models))

##extract predictors from candidate model set
orig.data <- extractX(cand.set = Cand.models)
orig.data
str(orig.data)

## Not run: 
##D ##model-averaged prediction with original variables
##D modavgPred(Cand.models, newdata = orig.data$data)
## End(Not run)


##example of model-averaged predictions from N-mixture model (e.g., Royle 2004)
##modified from ?pcount
##each variable appears twice on lambda in the models
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
##D names(Cands) <- c("length + forest", "elev + forest", "length + elev",
##D                   "null")
##D 
##D ##extract predictors on lambda
##D lam.dat <- extractX(cand.set = Cands, parm.type = "lambda")
##D lam.dat
##D str(lam.dat)
##D 
##D ##extract predictors on detectability
##D extractX(cand.set = Cands, parm.type = "detect")
##D 
##D ##model-averaged predictions on lambda
##D ##extract data
##D siteCovs <- lam.dat$data$siteCovs
##D ##create vector of forest values
##D forest <- seq(min(siteCovs$forest),
##D               max(siteCovs$forest),
##D               length.out = 40)
##D dframe <- data.frame(forest = forest,
##D                      length = mean(siteCovs$length),
##D                      elev = mean(siteCovs$elev))
##D modavgPred(Cands, parm.type = "lambda",
##D            newdata = dframe)
##D detach(package:unmarked)
## End(Not run)


##example of model-averaged abundance from distance model
## Not run: 
##D require(unmarked)
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
##D 
##D ##model-average predictions on abundance
##D extractX(cand.set = Cands, parm.type = "lambda")
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
##D Cand.models <- list("age effect" = m1, "null model" = m2)
##D 
##D ##model-averaged predictions
##D extractX(cand.set = Cand.models)
##D detach(package:nlme)
## End(Not run)



