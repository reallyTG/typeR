library(frailtypack)


### Name: epoce
### Title: Estimators of the Expected Prognostic Observed Cross-Entropy
###   (EPOCE) for evaluating predictive accuracy of joint models.
### Aliases: epoce
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D ########################################
##D #### EPOCE on a joint frailty model ####
##D ########################################
##D 
##D data(readmission)
##D 
##D modJoint.gap <- frailtyPenal(Surv(t.start,t.stop,event)~ cluster(id) +
##D   dukes + charlson + sex + chemo + terminal(death),
##D   formula.terminalEvent = ~ dukes + charlson + sex + chemo ,
##D   data = readmission, n.knots = 8, kappa =c(2.11e+08,9.53e+11),
##D   recurrentAG=TRUE)
##D 
##D # computation on the same dataset
##D temps <- c(200,500,800,1100)
##D epoce <- epoce(modJoint.gap,temps)
##D 
##D print(epoce)
##D plot(epoce,type = "cvpol")
##D 
##D # computation on a new dataset
##D # here a sample of readmission with the first 50 subjects
##D s <- readmission[1:100,]
##D epoce <- epoce(modJoint.gap,temps,newdata=s)
##D 
##D print(epoce)
##D plot(epoce,type = "cvpol")
##D 
##D #################################################
##D #### EPOCE on a joint  model for a biomarker ####
##D #########   and a terminal event  ###############
##D #################################################
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Survival data preparation - only terminal events 
##D colorectalSurv <- subset(colorectal, new.lesions == 0)
##D 
##D modLongi <- longiPenal(Surv(time0, time1, state) ~ age +
##D treatment + who.PS, tumor.size ~  year*treatment + age +
##D who.PS, colorectalSurv, data.Longi =colorectalLongi,
##D random = c("1", "year"),  id = "id", link = "Random-effects", 
##D left.censoring = -3.33, hazard = "Weibull", 
##D method.GH = "Pseudo-adaptive")
##D 
##D # computation on the same dataset
##D time <- c(1, 1.5, 2, 2.5)
##D epoce <- epoce(modLongi,time)
##D 
##D print(epoce)
##D plot(epoce, type = "cvpol")
##D 
##D # computation on a new dataset
##D # here a sample of colorectal data with the first 50 subjects
##D s <-  subset(colorectal, new.lesions == 0 & id%in%1:50)
##D s.Longi <- subset(colorectalLongi, id%in%1:50)
##D epoce <- epoce(modLongi, time, newdata = s, newdata.Longi = s.Longi)
##D 
##D print(epoce)
##D plot(epoce, type = "cvpol")
##D 
##D 
##D ###################################################
##D #### EPOCE on a joint model for a biomarker, ######
##D #### recurrent events and a terminal event   ######
##D ###################################################
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Linear model for the biomarker
##D # (computation takes around 30 minutes)
##D model.trivPenalNL <-trivPenal(Surv(gap.time, new.lesions) ~ cluster(id)
##D + age + treatment + who.PS + prev.resection + terminal(state),
##D formula.terminalEvent =~ age + treatment + who.PS + prev.resection, 
##D tumor.size ~ year * treatment + age + who.PS, data = colorectal,
##D data.Longi = colorectalLongi, random = c("1", "year"), id = "id", 
##D link = "Random-effects", left.censoring = -3.33, recurrentAG = FALSE,
##D hazard = "Weibull", method.GH="Pseudo-adaptive", n.nodes=7)
##D 
##D # computation on the same dataset
##D time <- c(1, 1.5, 2, 2.5)
##D 
##D # (computation takes around 10 minutes)
##D epoce <- epoce(model.trivPenalNL,time)
##D print(epoce)
##D plot(epoce, type = "cvpol")
##D 
##D # computation on a new dataset
##D # here a sample of colorectal data with the first 100 subjects
##D s <-  subset(colorectal,  id%in%1:100)
##D s.Longi <- subset(colorectalLongi, id%in%1:100)
##D # (computation takes around 10 minutes)
##D epoce <- epoce(model.trivPenalNL, time, newdata = s, newdata.Longi = s.Longi)
##D 
##D print(epoce)
##D plot(epoce, type = "cvpol")
##D 
##D 
##D 
##D # Non-linear model for the biomarker
##D 
##D # No information on dose - creation of a dummy variable 
##D colorectalLongi$dose <- 1
##D 
##D # (computation can take around 40 minutes)
##D model.trivPenalNL <- trivPenalNL(Surv(time0, time1, new.lesions) ~ cluster(id) + age + treatment
##D  + terminal(state), formula.terminalEvent =~ age + treatment, biomarker = "tumor.size",
##D  formula.KG ~ 1, formula.KD ~ treatment, dose = "dose", time.biomarker = "year", 
##D  data = colorectal, data.Longi =colorectalLongi, random = c("y0", "KG"), id = "id", 
##D  init.B = c(-0.22, -0.16, -0.35, -0.19, 0.04, -0.41, 0.23), init.Alpha = 1.86,
##D  init.Eta = c(0.5, 0.57, 0.5, 2.34), init.Biomarker = c(1.24, 0.81, 1.07, -1.53),
##D  recurrentAG = TRUE, n.knots = 5, kappa = c(0.01, 2), method.GH = "Pseudo-adaptive")
##D 
##D # computation on the same dataset
##D time <- c(1, 1.5, 2, 2.5)
##D 
##D epoce <- epoce(model.trivPenalNL, time)
##D 
##D 
## End(Not run)





