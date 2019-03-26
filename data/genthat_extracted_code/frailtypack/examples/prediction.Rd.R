library(frailtypack)


### Name: prediction
### Title: Prediction probabilities for Cox proportional hazard, Shared,
###   Joint frailty models, Joint models for longitudinal data and a
###   terminal event and Trivariate joint model for longitudinal data,
###   recurrent events and a terminal event (linear and non-linear).
### Aliases: prediction
### Keywords: misc

### ** Examples



## Not run: 
##D 
##D #####################################################
##D #### prediction on a COX or SHARED frailty model ####
##D #####################################################
##D 
##D data(readmission)
##D #-- here is a generated cluster (31 clusters of 13 subjects)
##D readmission <- transform(readmission,group=id%%31+1)
##D 
##D #-- we compute predictions of death
##D #-- we extract last row of each subject for the time of death
##D readmission <- aggregate(readmission,by=list(readmission$id),
##D                          FUN=function(x){x[length(x)]})[,-1]
##D 
##D ##-- predictions on a Cox proportional hazard model --##
##D cox <- frailtyPenal(Surv(t.stop,death)~sex+dukes,
##D n.knots=10,kappa=10000,data=readmission)
##D 
##D #-- construction of the data frame for predictions
##D datapred <- data.frame(sex=0,dukes=0)
##D datapred$sex <- as.factor(datapred$sex)
##D levels(datapred$sex)<- c(1,2)
##D datapred$dukes <- as.factor(datapred$dukes)
##D levels(datapred$dukes)<- c(1,2,3)
##D datapred[1,] <- c(1,2) # man, dukes 2
##D datapred[2,] <- c(2,3) # woman, dukes 3
##D 
##D #-- prediction of death for two patients between 100 and 100+w,
##D #-- with w in (50,100,...,1900)
##D pred.cox <- prediction(cox,datapred,t=100,window=seq(50,1900,50))
##D plot(pred.cox)
##D 
##D #-- prediction of death for two patients between t and t+400,
##D #-- with t in (100,150,...,1500)
##D pred.cox2 <- prediction(cox,datapred,t=seq(100,1500,50),window=400)
##D plot(pred.cox2)
##D 
##D ##-- predictions on a shared frailty model for clustered data --##
##D sha <- frailtyPenal(Surv(t.stop,death)~cluster(group)+sex+dukes,
##D n.knots=10,kappa=10000,data=readmission)
##D 
##D #-- marginal prediction
##D # a group must be specified but it does not influence the results 
##D # in the marginal predictions setting
##D datapred$group[1:2] <- 1
##D pred.sha.marg <- prediction(sha,datapred,t=100,window=seq(50,1900,50))
##D plot(pred.sha.marg)
##D 
##D #-- conditional prediction, given a specific cluster (group=5)
##D datapred$group[1:2] <- 5
##D pred.sha.cond <- prediction(sha,datapred,t=100,window=seq(50,1900,50),
##D                             conditional = TRUE)
##D plot(pred.sha.cond)
##D 
##D ##-- marginal prediction of a recurrent event, on a shared frailty model
##D data(readmission)
##D 
##D datapred <- data.frame(t.stop=0,event=0,id=0,sex=0,dukes=0)
##D datapred$sex <- as.factor(datapred$sex)
##D levels(datapred$sex)<- c(1,2)
##D datapred$dukes <- as.factor(datapred$dukes)
##D levels(datapred$dukes)<- c(1,2,3)
##D 
##D datapred[1,] <- c(100,1,1,1,2) #man, dukes 2, 3 recurrent events
##D datapred[2,] <- c(200,1,1,1,2) 
##D datapred[3,] <- c(300,1,1,1,2) 
##D datapred[4,] <- c(350,0,2,1,2) #man, dukes 2  0 recurrent event
##D 
##D #-- Shared frailty model with gamma distribution
##D sha <- frailtyPenal(Surv(t.stop,event)~cluster(id)+sex+dukes,n.knots=10,
##D kappa=10000,data=readmission)
##D pred.sha.rec.marg <- prediction(sha,datapred,t=200,window=seq(50,1900,50),
##D event='Recurrent',MC.sample=100)
##D 
##D plot(pred.sha.rec.marg,conf.bands=TRUE)
##D 
##D ##-- conditional prediction of a recurrent event, on a shared frailty model
##D pred.sha.rec.cond <- prediction(sha,datapred,t=200,window=seq(50,1900,50),
##D event='Recurrent',conditional = TRUE,MC.sample=100)
##D 
##D plot(pred.sha.rec.cond,conf.bands=TRUE)
##D #####################################################
##D ######## prediction on a JOINT frailty model ########
##D #####################################################
##D 
##D data(readmission)
##D 
##D ##-- predictions of death on a joint model --##
##D joi <- frailtyPenal(Surv(t.start,t.stop,event)~cluster(id)
##D +sex+dukes+terminal(death),formula.terminalEvent=~sex
##D +dukes,data=readmission,n.knots=10,kappa=c(100,100),recurrentAG=TRUE)
##D 
##D #-- construction of the data frame for predictions
##D datapredj <- data.frame(t.stop=0,event=0,id=0,sex=0,dukes=0)
##D datapredj$sex <- as.factor(datapredj$sex)
##D levels(datapredj$sex) <- c(1,2)
##D datapredj$dukes <- as.factor(datapredj$dukes)
##D levels(datapredj$dukes) <- c(1,2,3)
##D datapredj[1,] <- c(100,1,1,1,2)
##D datapredj[2,] <- c(200,1,1,1,2)
##D datapredj[3,] <- c(300,1,1,1,2)
##D datapredj[4,] <- c(400,1,1,1,2)
##D datapredj[5,] <- c(380,1,2,1,2)
##D 
##D #-- prediction of death between 100 and 100+500 given relapses
##D pred.joint0 <- prediction(joi,datapredj,t=100,window=500,event = "Terminal")
##D print(pred.joint0)
##D 
##D #-- prediction of death between 100 and 100+w given relapses 
##D # (with confidence intervals)
##D pred.joint <- prediction(joi,datapredj,t=100,window=seq(50,1500,50),
##D event = "Terminal",MC.sample=100)
##D plot(pred.joint,conf.bands=TRUE)
##D # each y-value of the plot corresponds to the prediction between [100,x]
##D 
##D #-- prediction of death between t and t+500 given relapses
##D pred.joint2 <- prediction(joi,datapredj,t=seq(100,1000,50),
##D window=500,event = "Terminal")
##D plot(pred.joint2)
##D # each y-value of the plot corresponds to the prediction between [x,x+500], 
##D #or in the next 500
##D 
##D #-- prediction of relapse between 100 and 100+w given relapses 
##D # (with confidence intervals)
##D pred.joint <- prediction(joi,datapredj,t=100,window=seq(50,1500,50),
##D event = "Recurrent",MC.sample=100)
##D plot(pred.joint,conf.bands=TRUE)
##D # each y-value of the plot corresponds to the prediction between [100,x]
##D 
##D #-- prediction of relapse and death between 100 and 100+w given relapses 
##D # (with confidence intervals)
##D pred.joint <- prediction(joi,datapredj,t=100,window=seq(50,1500,50),
##D event = "Both",MC.sample=100)
##D plot(pred.joint,conf.bands=TRUE)
##D # each y-value of the plot corresponds to the prediction between [100,x]
##D 
##D #############################################################################
##D ### prediction on a JOINT model for longitudinal data and a terminal event ####
##D #############################################################################
##D 
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D # Survival data preparation - only terminal events 
##D colorectalSurv <- subset(colorectal, new.lesions == 0)
##D 
##D #-- construction of the data-frame for predictions
##D #-- biomarker observations
##D datapredj_longi <- data.frame(id = 0, year = 0, tumor.size = 0, treatment = 0,
##D  age = 0, who.PS = 0, prev.resection = 0)
##D datapredj_longi$treatment <- as.factor(datapredj_longi$treatment)
##D levels(datapredj_longi$treatment) <- 1:2
##D datapredj_longi$age <- as.factor(datapredj_longi$age)
##D levels(datapredj_longi$age) <- 1:3
##D datapredj_longi$who.PS <- as.factor(datapredj_longi$who.PS)
##D levels(datapredj_longi$who.PS) <- 1:3
##D datapredj_longi$prev.resection <- as.factor(datapredj_longi$prev.resection)
##D levels(datapredj_longi$prev.resection) <- 1:2
##D 
##D # patient 1: increasing tumor size
##D datapredj_longi[1,] <- c(1, 0,1.2 ,2,1,1,1)
##D datapredj_longi[2,] <- c(1,0.3,1.4,2,1,1,1)
##D datapredj_longi[3,] <- c(1,0.6,1.9,2,1,1,1)
##D datapredj_longi[4,] <- c(1,0.9,2.5,2,1,1,1)
##D datapredj_longi[5,] <- c(1,1.5,3.9,2,1,1,1)
##D 
##D # patient 2: decreasing tumor size
##D datapredj_longi[6,] <- c(2, 0,1.2 ,2,1,1,1)
##D datapredj_longi[7,] <- c(2,0.3,0.7,2,1,1,1)
##D datapredj_longi[8,] <- c(2,0.5,0.3,2,1,1,1)
##D datapredj_longi[9,] <- c(2,0.7,0.1,2,1,1,1)
##D datapredj_longi[10,] <- c(2,0.9,0.1,2,1,1,1)
##D 
##D #-- terminal event
##D datapredj <- data.frame(id = 0, treatment = 0, age = 0, who.PS = 0,
##D prev.resection = 0)
##D datapredj$treatment <- as.factor(datapredj$treatment)
##D levels(datapredj$treatment) <- 1:2
##D datapredj$age <- as.factor(datapredj$age)
##D levels(datapredj$age) <- 1:3
##D datapredj$who.PS <- as.factor(datapredj$who.PS)
##D datapredj$prev.resection <- as.factor(datapredj$prev.resection)
##D levels(datapredj$prev.resection) <- 1:2
##D levels(datapredj$who.PS) <- 1:3
##D datapredj[1,] <- c(1,2,1,1,1)
##D datapredj[2,] <- c(2,2,1,1,1)
##D 
##D model.spli.CL <- longiPenal(Surv(time1, state) ~ age + treatment + who.PS
##D + prev.resection, tumor.size ~  year * treatment + age + who.PS , 
##D colorectalSurv, data.Longi = colorectalLongi, random = c("1", "year"),
##D id = "id", link = "Current-level", left.censoring = -3.33, n.knots = 6, 
##D kappa = 1)
##D 
##D #-- prediction of death between 1 year and 1+2 given history of the biomarker
##D pred.jointLongi0 <- prediction(model.spli.CL, datapredj, datapredj_longi,
##D t = 1, window = 2)
##D print(pred.jointLongi0)
##D 
##D #-- prediction of death between 1 year and 1+w given history of the biomarker
##D pred.jointLongi <- prediction(model.spli.CL, datapredj, datapredj_longi,
##D t = 1, window = seq(0.5, 2.5, 0.2), MC.sample = 100)
##D plot(pred.jointLongi, conf.bands = TRUE)
##D # each y-value of the plot corresponds to the prediction between [1,x]
##D 
##D #-- prediction of death between t and t+0.5 given history of the biomarker
##D pred.jointLongi2 <- prediction(model.spli.CL, datapredj, datapredj_longi,
##D t = seq(1, 2.5, 0.5), window = 0.5, MC.sample = 100)
##D plot(pred.jointLongi2, conf.bands = TRUE)
##D # each y-value of the plot corresponds to the prediction between [x,x+0.5], 
##D #or in the next 0.5
##D 
##D #############################################################################
##D ##### marginal prediction on a JOINT NESTED model for a terminal event ######
##D #############################################################################
##D #*--Warning! You can compute this prediction method with ONLY ONE family 
##D #*--by dataset of prediction. 
##D #*--Please make sure your data frame contains a column for individuals AND a 
##D #*--column for the reference number of the family chosen.
##D 
##D data(readmission)
##D readmissionNested <- transform(readmission,group=id%%30+1)
##D 
##D #-- construction of the data frame for predictions : 
##D #-- family 5 was selected for the prediction
##D 
##D DataPred <- readmissionNested[which(readmissionNested$group==5),]
##D 
##D #-- Fitting the model
##D modJointNested_Splines <- 
##D frailtyPenal(formula = Surv(t.start, t.stop, event)~subcluster(id)+ 
##D cluster(group) + dukes + terminal(death),formula.terminalEvent
##D =~dukes, data = readmissionNested, recurrentAG = TRUE,n.knots = 8, 
##D kappa = c(9.55e+9, 1.41e+12), initialize = TRUE)
##D 
##D #-- Compute prediction over the individuals 274 and 4 of the family 5
##D predRead <- prediction(modJointNested_Splines, data=DataPred,t=500,
##D window=seq(100,1500,200), conditional=FALSE, individual = c(274, 4))
##D 
##D 
##D #########################################################################
##D ##### prediction on TRIVARIATE JOINT model (linear and non-linear) ######
##D #########################################################################
##D 
##D data(colorectal)
##D data(colorectalLongi)
##D 
##D #-- construction of the data frame for predictions
##D #-- history of recurrences and terminal event
##D datapredj <- data.frame(time0 = 0, time1 = 0, new.lesions = 0, id = 0, 
##D treatment = 0, age = 0, who.PS = 0, prev.resection =0)
##D datapredj$treatment <- as.factor(datapredj$treatment)
##D levels(datapredj$treatment) <- 1:2
##D datapredj$age <- as.factor(datapredj$age)
##D levels(datapredj$age) <- 1:3
##D datapredj$who.PS <- as.factor(datapredj$who.PS)
##D levels(datapredj$who.PS) <- 1:3
##D datapredj$prev.resection <- as.factor(datapredj$prev.resection)
##D levels(datapredj$prev.resection) <- 1:2
##D 
##D datapredj[1,] <- c(0,0.4,1,1,2,1,1,1)
##D datapredj[2,] <- c(0.4,1.2,1,1,2,1,1,1)
##D datapredj[3,] <- c(0,0.5,1,2,2,1,1,1)
##D 
##D # Linear trivariate joint model
##D # (computation takes around 40 minutes)
##D model.trivPenal <-trivPenal(Surv(time0, time1, new.lesions) ~ cluster(id)
##D + age + treatment + who.PS +  terminal(state),
##D formula.terminalEvent =~ age + treatment + who.PS + prev.resection, 
##D tumor.size ~ year * treatment + age + who.PS, data = colorectal, 
##D data.Longi = colorectalLongi, random = c("1", "year"), id = "id", 
##D link = "Random-effects", left.censoring = -3.33, recurrentAG = TRUE,
##D n.knots = 6, kappa=c(0.01, 2), method.GH="Pseudo-adaptive",
##D n.nodes=7, init.B = c(-0.07, -0.13, -0.16, -0.17, 0.42, #recurrent events covarates
##D -0.23, -0.1, -0.09, -0.12, 0.8, -0.23, #terminal event covariates
##D 3.02, -0.30, 0.05, -0.63, -0.02, -0.29, 0.11, 0.74)) #biomarker covariates
##D 
##D #-- prediction of death between 1 year and 1+2
##D pred.jointTri0 <- prediction(model.trivPenal, datapredj, 
##D datapredj_longi, t = 1, window = 2)
##D print(pred.jointTri0)
##D 
##D #-- prediction of death between 1 year and 1+w
##D pred.jointTri <- prediction(model.trivPenal, datapredj, 
##D datapredj_longi, t = 1, window = seq(0.5, 2.5, 0.2), MC.sample = 100)
##D plot(pred.jointTri, conf.bands = TRUE)
##D 
##D #-- prediction of death between t and t+0.5
##D pred.jointTri2 <- prediction(model.trivPenal, datapredj, 
##D datapredj_longi, t = seq(1, 2.5, 0.5), window = 0.5, MC.sample = 100)
##D plot(pred.jointTri2, conf.bands = TRUE)
##D 
##D 
##D ###############################
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
##D #-- prediction of death between 1 year and 1+2
##D pred.jointTriNL0 <- prediction(model.trivPenalNL, datapredj, 
##D datapredj_longi, t = 1, window = 2)
##D print(pred.jointTriNL0)
##D 
##D #-- prediction of death between 1 year and 1+w 
##D pred.jointTriNL <- prediction(model.trivPenalNL, datapredj, 
##D datapredj_longi, t = 1, window = seq(0.5, 2.5, 0.2), MC.sample = 100)
##D plot(pred.jointTriNL, conf.bands = TRUE)
##D 
##D #-- prediction of death between t and t+0.5
##D pred.jointTriNL2 <- prediction(model.trivPenalNL, datapredj, 
##D datapredj_longi, t = seq(2, 3, 0.2), window = 0.5, MC.sample = 100)
##D plot(pred.jointTriNL2, conf.bands = TRUE)
##D 
## End(Not run)





