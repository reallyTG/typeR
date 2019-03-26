library(frailtypack)


### Name: frailtypack-package
### Title: General Frailty models: shared, joint and nested frailty models
###   with prediction; Evaluation of Failure-Time Surrogate Endpoints
### Aliases: frailtypack-package frailtypack
### Keywords: package

### ** Examples



## Not run: 
##D 
##D ###--- Additive model with 1 covariate ---###
##D 
##D data(dataAdditive)
##D modAdd <- additivePenal(Surv(t1,t2,event)~
##D cluster(group)+var1+slope(var1),
##D correlation=TRUE,data=dataAdditive,
##D n.knots=8,kappa=10000,hazard="Splines")
##D 
##D ###--- Joint model (recurrent and terminal events) with 2 covariates ---###
##D 
##D data(readmission)
##D modJoint.gap <- frailtyPenal(Surv(time,event)~
##D cluster(id)+sex+dukes+charlson+terminal(death),
##D formula.terminalEvent=~sex+dukes+charlson,
##D data=readmission,n.knots=10,kappa=c(100,100),
##D recurrentAG=FALSE,hazard="Splines")
##D 
##D ###--- General Joint model (recurrent and terminal events) with 2 covariates ---###
##D data(readmission)
##D modJoint.general <- frailtyPenal(Surv(time,event) ~ cluster(id) + dukes +
##D charlson + sex + chemo + terminal(death),
##D formula.terminalEvent = ~ dukes + charlson + sex + chemo,
##D data = readmission, jointGeneral = TRUE, n.knots = 8,
##D kappa = c(2.11e+08, 9.53e+11))
##D 
##D ###--- Nested model (or hierarchical model) with 2 covariates ---###
##D 
##D data(dataNested)
##D modClu <- frailtyPenal(Surv(t1,t2,event)~
##D cluster(group)+subcluster(subgroup)+cov1+cov2,
##D data=dataNested,n.knots=8,kappa=50000,hazard="Splines")
##D 
##D ###--- Joint Nested Frailty model ---###
##D 
##D #-- here is generated cluster (30 clusters)
##D readmissionNested <- transform(readmission,group=id%%30+1)
##D 
##D modJointNested_Splines <- frailtyPenal(formula = Surv(t.start, t.stop, event) 
##D ~ subcluster(id) + cluster(group) + dukes + terminal(death), 
##D formula.terminalEvent = ~dukes, data = readmissionNested, recurrentAG = TRUE, 
##D n.knots = 8, kappa = c(9.55e+9, 1.41e+12), initialize = TRUE)
##D 
##D modJointNested_Weib <- frailtyPenal(Surv(t.start,t.stop,event)~subcluster(id)
##D +cluster(group)+dukes+ terminal(death),formula.terminalEvent=~dukes, 
##D hazard = ('Weibull'), data=readmissionNested,recurrentAG=TRUE, initialize = FALSE)
##D 
##D JoiNes-GapSpline <- frailtyPenal(formula = Surv(time, event) 
##D ~ subcluster(id) + cluster(group) + dukes + terminal(death), 
##D formula.terminalEvent = ~dukes, data = readmissionNested, recurrentAG = FALSE, 
##D n.knots = 8, kappa = c(9.55e+9, 1.41e+12), initialize = TRUE,
##D init.Alpha = 1.091, Ksi = "None")
##D 
##D ###--- Semiparametric Shared model ---###
##D 
##D data(readmission)
##D sha.sp <- frailtyPenal(Surv(t.start,t.stop,event)~
##D sex+dukes+charlson+cluster(id),data=readmission,
##D n.knots=6,kappa=5000,recurrentAG=TRUE,
##D cross.validation=TRUE,hazard="Splines")
##D 
##D ###--- Parametric Shared model ---###
##D 
##D data(readmission)
##D sha.p <- frailtyPenal(Surv(t.start,t.stop,event)~
##D cluster(id)+sex+dukes+charlson,
##D data=readmission,recurrentAG=TRUE,
##D hazard="Piecewise-per",nb.int=6)
##D 
##D ###--- Joint model for longitudinal ---###
##D ###--- data and a terminal event ---###
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Survival data preparation - only terminal events 
##D colorectalSurv <- subset(colorectal, new.lesions == 0)
##D 
##D model.weib.RE <- longiPenal(Surv(time1, state) ~ age + treatment + who.PS 
##D + prev.resection, tumor.size ~  year * treatment + age + who.PS ,
##D colorectalSurv,	data.Longi = colorectalLongi, 
##D random = c("1", "year"), id = "id", link = "Random-effects", 
##D left.censoring = -3.33, hazard = "Weibull")
##D 
##D ###--- Trivariate joint model for longitudinal ---###
##D ###--- data, recurrent and terminal events ---###
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # (computation takes around 40 minutes)
##D 
##D model.spli.RE.cal <-trivPenal(Surv(time0, time1, new.lesions) ~ cluster(id)
##D + age + treatment + who.PS +  terminal(state),
##D formula.terminalEvent =~ age + treatment + who.PS + prev.resection, 
##D tumor.size ~ year * treatment + age + who.PS, data = colorectal, 
##D data.Longi = colorectalLongi, random = c("1", "year"), id = "id", 
##D link = "Random-effects", left.censoring = -3.33, recurrentAG = TRUE,
##D n.knots = 6, kappa=c(0.01, 2), method.GH="Pseudo-adaptive",
##D n.nodes=7, init.B = c(-0.07, -0.13, -0.16, -0.17, 0.42, #recurrent events covariates
##D -0.23, -0.1, -0.09, -0.12, 0.8, -0.23, #terminal event covariates
##D 3.02, -0.30, 0.05, -0.63, -0.02, -0.29, 0.11, 0.74)) #biomarker covariates
##D 
##D 
##D ##---Surrogacy evaluation based on ganerated data with a combination 
##D ##of Monte Carlo and classical Gaussian Hermite integration.
##D ## (Computation takes around 5 minutes)
##D 
##D # Generation of data to use 
##D data.sim <- jointSurrSimul(n.obs=600, n.trial = 30,cens.adm=549.24, 
##D          alpha = 1.5, theta = 3.5, gamma = 2.5, zeta = 1, sigma.s = 0.7, 
##D          sigma.t = 0.7, rsqrt = 0.8, betas = -1.25, betat = -1.25, 
##D          full.data = 0, random.generator = 1, seed = 0, nb.reject.data = 0)
##D 
##D # Joint surrogate model estimation
##D joint.surro.sim.MCGH <- jointSurroPenal(data = data.sim, int.method = 2, 
##D                    nb.mc = 300, nb.gh = 20)
##D 
## End(Not run)



