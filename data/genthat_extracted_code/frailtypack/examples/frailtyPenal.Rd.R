library(frailtypack)


### Name: frailtyPenal
### Title: Fit a Shared, Joint or Nested Frailty model
### Aliases: frailtyPenal waldtest factor.names timedep.names
### Keywords: models

### ** Examples



## Not run: 
##D 
##D ###---  COX proportional hazard model (SHARED without frailties) ---###
##D ###---  estimated with penalized likelihood ---###
##D 
##D data(kidney)
##D frailtyPenal(Surv(time,status)~sex+age,
##D n.knots=12,kappa=10000,data=kidney)
##D 
##D ###---  Shared Frailty model  ---###
##D 
##D frailtyPenal(Surv(time,status)~cluster(id)+sex+age,
##D n.knots=12,kappa=10000,data=kidney)
##D 
##D #-- with an initialisation of regression coefficients
##D 
##D frailtyPenal(Surv(time,status)~cluster(id)+sex+age,
##D n.knots=12,kappa=10000,data=kidney,init.B=c(-1.44,0))
##D 
##D #-- with truncated data
##D 
##D data(dataNested)
##D 
##D frailtyPenal(Surv(t1,t2,event) ~ cluster(group),
##D data=dataNested,n.knots=10,kappa=10000,
##D cross.validation=TRUE,recurrentAG=FALSE)
##D 
##D #-- stratified analysis
##D 
##D data(readmission)
##D frailtyPenal(Surv(time,event)~cluster(id)+dukes+strata(sex),
##D n.knots=10,kappa=c(10000,10000),data=readmission)
##D 
##D #-- recurrentAG=TRUE
##D 
##D frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+sex+dukes+
##D charlson,data=readmission,n.knots=6,kappa=1e5,recurrentAG=TRUE)
##D 
##D #-- cross.validation=TRUE
##D 
##D frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+sex+dukes+
##D charlson,data=readmission,n.knots=6,kappa=5000,recurrentAG=TRUE,
##D cross.validation=TRUE)
##D 
##D #-- log-normal distribution
##D 
##D frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+sex+dukes+
##D charlson,data=readmission,n.knots=6,kappa=5000,recurrentAG=TRUE,
##D RandDist="LogN")
##D 
##D ###--- Joint Frailty model (recurrent and terminal events) ---###
##D 
##D data(readmission)
##D #-- Gap-time
##D modJoint.gap <- frailtyPenal(Surv(time,event)~cluster(id)+sex+dukes+charlson+
##D terminal(death),formula.terminalEvent=~sex+dukes+charlson,
##D data=readmission,n.knots=14,kappa=c(9.55e+9,1.41e+12),
##D recurrentAG=FALSE)
##D 
##D #-- Calendar time
##D modJoint.calendar <- frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+
##D sex+dukes+charlson+terminal(death),formula.terminalEvent=~sex
##D +dukes+charlson,data=readmission,n.knots=10,kappa=c(9.55e9,1.41e12),
##D recurrentAG=TRUE)
##D 
##D #-- without alpha parameter
##D modJoint.gap <- frailtyPenal(Surv(time,event)~cluster(id)+sex+dukes+charlson+
##D terminal(death),formula.terminalEvent=~sex+dukes+charlson,
##D data=readmission,n.knots=10,kappa=c(9.55e9,1.41e12),
##D recurrentAG=FALSE,Alpha="None")
##D 
##D #-- log-normal distribution
##D 
##D modJoint.log <- frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+sex
##D +dukes+charlson+terminal(death),formula.terminalEvent=~sex
##D +dukes+charlson,data=readmission,n.knots=10,kappa=c(9.55e9,1.41e12),
##D recurrentAG=TRUE,RandDist="LogN")
##D 
##D ###--- Joint frailty model for NCC data ---###
##D data(dataNCC)
##D modJoint.ncc <- frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)+cov1
##D +cov2+terminal(death)+wts(ncc.wts), formula.terminalEvent=~cov1+cov2,
##D data=dataNCC,n.knots=8,kappa=c(1.6e+10, 5.0e+03),recurrentAG=TRUE, RandDist="LogN") 
##D 
##D 
##D ###--- Joint Frailty model for clustered data ---###
##D 
##D #-- here is generated cluster (5 clusters)
##D readmission <- transform(readmission,group=id%%5+1)
##D 
##D #-- exclusion all recurrent events --#
##D #--  to obtain framework of semi-competing risks --#
##D readmission2 <- subset(readmission, (t.start == 0 & event == 1) | event == 0)
##D 
##D joi.clus.gap <- frailtyPenal(Surv(time,event)~cluster(group)+
##D num.id(id)+dukes+charlson+sex+chemo+terminal(death),
##D formula.terminalEvent=~dukes+charlson+sex+chemo,
##D data=readmission2,recurrentAG=FALSE, n.knots=8,
##D kappa=c(1.e+10,1.e+10) ,Alpha="None")
##D 
##D 
##D ###--- General Joint model (recurrent and terminal events) 
##D with 2 covariates ---###
##D 
##D data(readmission)
##D modJoint.general <- frailtyPenal(Surv(time,event) ~ cluster(id) + dukes +
##D charlson + sex  + chemo + terminal(death), 
##D formula.terminalEvent = ~ dukes + charlson + sex + chemo,
##D data = readmission, jointGeneral = TRUE,  n.knots = 8, 
##D kappa = c(2.11e+08, 9.53e+11))
##D 
##D 
##D ###--- Nested Frailty model ---###
##D 
##D ##***** WARNING *****##
##D # Data should be ordered according to cluster and subcluster
##D 
##D data(dataNested)
##D modClu <- frailtyPenal(Surv(t1,t2,event)~cluster(group)+
##D subcluster(subgroup)+cov1+cov2,data=dataNested,
##D n.knots=8,kappa=50000)
##D 
##D modClu.str <- frailtyPenal(Surv(t1,t2,event)~cluster(group)+
##D subcluster(subgroup)+cov1+strata(cov2),data=dataNested,
##D n.knots=8,kappa=c(50000,50000))
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
##D JoiNes_GapSpline <- frailtyPenal(formula = Surv(time, event) 
##D ~ subcluster(id) + cluster(group) + dukes + terminal(death), 
##D formula.terminalEvent = ~dukes, data = readmissionNested, 
##D recurrentAG = FALSE, n.knots = 8, kappa = c(9.55e+9, 1.41e+12), 
##D initialize = TRUE, init.Alpha = 1.091, Ksi = "None")
##D 
## End(Not run)





