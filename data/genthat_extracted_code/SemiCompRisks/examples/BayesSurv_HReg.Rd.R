library(SemiCompRisks)


### Name: BayesSurv_HReg
### Title: The function to implement Bayesian parametric and
###   semi-parametric regression analyses for univariate time-to-event data
###   in the context of hazard regression (HReg) models.
### Aliases: BayesSurv_HReg
### Keywords: Bayesian framework univariate analysis hazard regression
###   models

### ** Examples

	
## Not run: 
##D 		
##D # loading a data set	
##D data(survData)
##D id=survData$cluster
##D 
##D form <- Formula(time + event ~ cov1 + cov2)
##D 
##D #####################
##D ## Hyperparameters ##
##D #####################
##D 
##D ## Weibull baseline hazard function: alpha1, kappa1
##D ##
##D WB.ab <- c(0.5, 0.01) # prior parameters for alpha
##D ##
##D WB.cd <- c(0.5, 0.05) # prior parameters for kappa
##D 
##D ## PEM baseline hazard function: 
##D ##
##D PEM.ab <- c(0.7, 0.7) # prior parameters for 1/sigma^2
##D ##
##D PEM.alpha <- 10 # prior parameters for K
##D 
##D ## Normal cluster-specific random effects
##D ##
##D Normal.ab 	<- c(0.5, 0.01) 		# prior for zeta
##D 
##D ## DPM cluster-specific random effects
##D ##
##D DPM.ab <- c(0.5, 0.01)
##D aTau  <- 1.5
##D bTau  <- 0.0125
##D 
##D ##
##D hyperParams <- list(WB=list(WB.ab=WB.ab, WB.cd=WB.cd),
##D                     PEM=list(PEM.ab=PEM.ab, PEM.alpha=PEM.alpha),
##D                     Normal=list(Normal.ab=Normal.ab),
##D                     DPM=list(DPM.ab=DPM.ab, aTau=aTau, bTau=bTau))
##D                     
##D ###################
##D ## MCMC SETTINGS ##
##D ###################
##D 
##D ## Setting for the overall run
##D ##
##D numReps    <- 2000
##D thin       <- 10
##D burninPerc <- 0.5
##D 
##D ## Settings for storage
##D ##
##D storeV    <- TRUE
##D 
##D ## Tuning parameters for specific updates
##D ##
##D ##  - those common to all models
##D mhProp_V_var     <- 0.05
##D ##
##D ## - those specific to the Weibull specification of the baseline hazard functions
##D mhProp_alpha_var <- 0.01
##D ##
##D ## - those specific to the PEM specification of the baseline hazard functions
##D C        <- 0.2
##D delPert  <- 0.5
##D rj.scheme <- 1
##D K_max    <- 50
##D s_max    <- max(survData$time[survData$event == 1])
##D time_lambda <- seq(1, s_max, 1)
##D 
##D ##
##D mcmc.WB  <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D                     storage=list(storeV=storeV),
##D                     tuning=list(mhProp_alpha_var=mhProp_alpha_var, mhProp_V_var=mhProp_V_var))
##D ##
##D mcmc.PEM <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D                     storage=list(storeV=storeV),
##D                     tuning=list(mhProp_V_var=mhProp_V_var, C=C, delPert=delPert,
##D                     rj.scheme=rj.scheme, K_max=K_max, time_lambda=time_lambda))
##D 
##D ################################################################
##D ## Analysis of Independent Univariate Survival Data ############
##D ################################################################
##D 
##D #############
##D ## WEIBULL ##
##D #############
##D 
##D ##
##D myModel <- "Weibull"
##D myPath  <- "Output/01-Results-WB/"
##D 
##D startValues      <- initiate.startValues_HReg(form, survData, model=myModel, nChain=2)
##D 
##D ##
##D fit_WB <- BayesSurv_HReg(form, survData, id=NULL, model=myModel, 
##D                   hyperParams, startValues, mcmc.WB, path=myPath)
##D                   
##D fit_WB
##D summ.fit_WB <- summary(fit_WB); names(summ.fit_WB)
##D summ.fit_WB
##D pred_WB <- predict(fit_WB, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB, plot.est="Haz")
##D plot(pred_WB, plot.est="Surv")
##D 
##D #########
##D ## PEM ##
##D #########
##D                 
##D ##
##D myModel <- "PEM"
##D myPath  <- "Output/02-Results-PEM/"
##D 
##D startValues      <- initiate.startValues_HReg(form, survData, model=myModel, nChain=2)
##D 
##D ##
##D fit_PEM <- BayesSurv_HReg(form, survData, id=NULL, model=myModel,
##D                    hyperParams, startValues, mcmc.PEM, path=myPath)
##D                    
##D fit_PEM
##D summ.fit_PEM <- summary(fit_PEM); names(summ.fit_PEM)
##D summ.fit_PEM
##D pred_PEM <- predict(fit_PEM)
##D plot(pred_PEM, plot.est="Haz")
##D plot(pred_PEM, plot.est="Surv")
##D 
##D ###############################################################
##D ## Analysis of Correlated Univariate Survival Data ############
##D ###############################################################
##D 
##D ####################
##D ## WEIBULL-NORMAL ##
##D ####################
##D 
##D ##
##D myModel <- c("Weibull", "Normal")
##D myPath  <- "Output/03-Results-WB_Normal/"
##D 
##D startValues      <- initiate.startValues_HReg(form, survData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_WB_N <- BayesSurv_HReg(form, survData, id, model=myModel,
##D                         hyperParams, startValues, mcmc.WB, path=myPath)
##D                         
##D fit_WB_N
##D summ.fit_WB_N <- summary(fit_WB_N); names(summ.fit_WB_N)
##D summ.fit_WB_N
##D pred_WB_N <- predict(fit_WB_N, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB_N, plot.est="Haz")
##D plot(pred_WB_N, plot.est="Surv")
##D 
##D #################
##D ## WEIBULL-DPM ##
##D #################
##D 
##D ##
##D myModel <- c("Weibull", "DPM")
##D myPath  <- "Output/04-Results-WB_DPM/"
##D 
##D startValues      <- initiate.startValues_HReg(form, survData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_WB_DPM <- BayesSurv_HReg(form, survData, id, model=myModel,
##D                         hyperParams, startValues, mcmc.WB, path=myPath)
##D 
##D fit_WB_DPM
##D summ.fit_WB_DPM <- summary(fit_WB_DPM); names(summ.fit_WB_DPM)
##D summ.fit_WB_DPM
##D pred_WB_DPM <- predict(fit_WB_DPM, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB_DPM, plot.est="Haz")
##D plot(pred_WB_DPM, plot.est="Surv")
##D 
##D ################
##D ## PEM-NORMAL ##
##D ################
##D 
##D ##
##D myModel <- c("PEM", "Normal")
##D myPath  <- "Output/05-Results-PEM_Normal/"
##D 
##D startValues      <- initiate.startValues_HReg(form, survData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_PEM_N <- BayesSurv_HReg(form, survData, id, model=myModel,
##D                             hyperParams, startValues, mcmc.PEM, path=myPath)
##D 
##D fit_PEM_N
##D summ.fit_PEM_N <- summary(fit_PEM_N); names(summ.fit_PEM_N)
##D summ.fit_PEM_N
##D pred_PEM_N <- predict(fit_PEM_N)
##D plot(pred_PEM_N, plot.est="Haz")
##D plot(pred_PEM_N, plot.est="Surv")
##D 
##D #############
##D ## PEM-DPM ##
##D #############
##D 
##D ##
##D myModel <- c("PEM", "DPM")
##D myPath  <- "Output/06-Results-PEM_DPM/"
##D 
##D startValues      <- initiate.startValues_HReg(form, survData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_PEM_DPM <- BayesSurv_HReg(form, survData, id, model=myModel,
##D                         hyperParams, startValues, mcmc.PEM, path=myPath)
##D                         
##D fit_PEM_DPM
##D summ.fit_PEM_DPM <- summary(fit_PEM_DPM); names(summ.fit_PEM_DPM)
##D summ.fit_PEM_DPM
##D pred_PEM_DPM <- predict(fit_PEM_DPM)
##D plot(pred_PEM_DPM, plot.est="Haz")
##D plot(pred_PEM_DPM, plot.est="Surv")
## End(Not run)



