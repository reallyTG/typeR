library(SemiCompRisks)


### Name: BayesID_HReg
### Title: The function to implement Bayesian parametric and
###   semi-parametric analyses for semi-competing risks data in the context
###   of hazard regression (HReg) models.
### Aliases: BayesID_HReg
### Keywords: Bayesian framework semi-competing risks analysis hazard
###   regression models

### ** Examples


## Not run: 
##D    
##D # loading a data set
##D data(scrData)
##D id=scrData$cluster
##D 
##D form <- Formula(time1 + event1 | time2 + event2 ~ x1 + x2 + x3 | x1 + x2 | x1 + x2)
##D 
##D #####################
##D ## Hyperparameters ##
##D #####################
##D 
##D ## Subject-specific frailty variance component
##D ##  - prior parameters for 1/theta
##D ##
##D theta.ab <- c(0.7, 0.7)
##D 
##D ## Weibull baseline hazard function: alphas, kappas
##D ##
##D WB.ab1 <- c(0.5, 0.01) # prior parameters for alpha1
##D WB.ab2 <- c(0.5, 0.01) # prior parameters for alpha2
##D WB.ab3 <- c(0.5, 0.01) # prior parameters for alpha3
##D ##
##D WB.cd1 <- c(0.5, 0.05) # prior parameters for kappa1
##D WB.cd2 <- c(0.5, 0.05) # prior parameters for kappa2
##D WB.cd3 <- c(0.5, 0.05) # prior parameters for kappa3
##D 
##D ## PEM baseline hazard function
##D ##
##D PEM.ab1 <- c(0.7, 0.7) # prior parameters for 1/sigma_1^2
##D PEM.ab2 <- c(0.7, 0.7) # prior parameters for 1/sigma_2^2
##D PEM.ab3 <- c(0.7, 0.7) # prior parameters for 1/sigma_3^2
##D ##
##D PEM.alpha1 <- 10 # prior parameters for K1
##D PEM.alpha2 <- 10 # prior parameters for K2
##D PEM.alpha3 <- 10 # prior parameters for K3
##D 
##D ## MVN cluster-specific random effects
##D ##
##D Psi_v <- diag(1, 3)
##D rho_v <- 100
##D 
##D ## DPM cluster-specific random effects
##D ##
##D Psi0  <- diag(1, 3)
##D rho0  <- 10
##D aTau  <- 1.5
##D bTau  <- 0.0125
##D 
##D ##
##D hyperParams <- list(theta=theta.ab,
##D                 WB=list(WB.ab1=WB.ab1, WB.ab2=WB.ab2, WB.ab3=WB.ab3,
##D                        WB.cd1=WB.cd1, WB.cd2=WB.cd2, WB.cd3=WB.cd3),
##D                    PEM=list(PEM.ab1=PEM.ab1, PEM.ab2=PEM.ab2, PEM.ab3=PEM.ab3,
##D                        PEM.alpha1=PEM.alpha1, PEM.alpha2=PEM.alpha2, PEM.alpha3=PEM.alpha3),
##D                    MVN=list(Psi_v=Psi_v, rho_v=rho_v),
##D                    DPM=list(Psi0=Psi0, rho0=rho0, aTau=aTau, bTau=bTau))
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
##D nGam_save <- 0
##D storeV    <- rep(TRUE, 3)
##D 
##D ## Tuning parameters for specific updates
##D ##
##D ##  - those common to all models
##D mhProp_theta_var  <- 0.05
##D mhProp_Vg_var     <- c(0.05, 0.05, 0.05)
##D ##
##D ## - those specific to the Weibull specification of the baseline hazard functions
##D mhProp_alphag_var <- c(0.01, 0.01, 0.01)
##D ##
##D ## - those specific to the PEM specification of the baseline hazard functions
##D Cg        <- c(0.2, 0.2, 0.2)
##D delPertg  <- c(0.5, 0.5, 0.5)
##D rj.scheme <- 1
##D Kg_max    <- c(50, 50, 50)
##D sg_max    <- c(max(scrData$time1[scrData$event1 == 1]),
##D                max(scrData$time2[scrData$event1 == 0 & scrData$event2 == 1]),
##D                max(scrData$time2[scrData$event1 == 1 & scrData$event2 == 1]))
##D 
##D time_lambda1 <- seq(1, sg_max[1], 1)
##D time_lambda2 <- seq(1, sg_max[2], 1)
##D time_lambda3 <- seq(1, sg_max[3], 1)               
##D 
##D ##
##D mcmc.WB  <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D                 storage=list(nGam_save=nGam_save, storeV=storeV),
##D                 tuning=list(mhProp_theta_var=mhProp_theta_var,
##D                 mhProp_Vg_var=mhProp_Vg_var, mhProp_alphag_var=mhProp_alphag_var))
##D 
##D ##
##D mcmc.PEM <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D                 storage=list(nGam_save=nGam_save, storeV=storeV),
##D                 tuning=list(mhProp_theta_var=mhProp_theta_var,
##D                 mhProp_Vg_var=mhProp_Vg_var, Cg=Cg, delPertg=delPertg,
##D                 rj.scheme=rj.scheme, Kg_max=Kg_max,
##D                 time_lambda1=time_lambda1, time_lambda2=time_lambda2,
##D                 time_lambda3=time_lambda3))
##D     
##D #####################
##D ## Starting Values ##
##D #####################
##D 
##D ##
##D Sigma_V <- diag(0.1, 3)
##D Sigma_V[1,2] <- Sigma_V[2,1] <- -0.05
##D Sigma_V[1,3] <- Sigma_V[3,1] <- -0.06
##D Sigma_V[2,3] <- Sigma_V[3,2] <- 0.07
##D 
##D #################################################################
##D ## Analysis of Independent Semi-Competing Risks Data ############
##D #################################################################
##D 
##D #############
##D ## WEIBULL ##
##D #############
##D 
##D ##
##D myModel <- c("semi-Markov", "Weibull")
##D myPath  <- "Output/01-Results-WB/"
##D 
##D startValues      <- initiate.startValues_HReg(form, scrData, model=myModel, nChain=2)
##D 
##D ##
##D fit_WB <- BayesID_HReg(form, scrData, id=NULL, model=myModel,
##D                 hyperParams, startValues, mcmc.WB, path=myPath)
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
##D myModel <- c("semi-Markov", "PEM")
##D myPath  <- "Output/02-Results-PEM/"
##D 
##D startValues      <- initiate.startValues_HReg(form, scrData, model=myModel, nChain=2)
##D 
##D ##
##D fit_PEM <- BayesID_HReg(form, scrData, id=NULL, model=myModel,
##D                  hyperParams, startValues, mcmc.PEM, path=myPath)
##D 				
##D fit_PEM
##D summ.fit_PEM <- summary(fit_PEM); names(summ.fit_PEM)
##D summ.fit_PEM
##D pred_PEM <- predict(fit_PEM)
##D plot(pred_PEM, plot.est="Haz")
##D plot(pred_PEM, plot.est="Surv")
##D 					
##D #################################################################
##D ## Analysis of Correlated Semi-Competing Risks Data #############
##D #################################################################
##D 
##D #################
##D ## WEIBULL-MVN ##
##D #################
##D 
##D ##
##D myModel <- c("semi-Markov", "Weibull", "MVN")
##D myPath  <- "Output/03-Results-WB_MVN/"
##D 
##D startValues      <- initiate.startValues_HReg(form, scrData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_WB_MVN <- BayesID_HReg(form, scrData, id, model=myModel,
##D                     hyperParams, startValues, mcmc.WB, path=myPath)
##D                     
##D fit_WB_MVN
##D summ.fit_WB_MVN <- summary(fit_WB_MVN); names(summ.fit_WB_MVN)
##D summ.fit_WB_MVN
##D pred_WB_MVN <- predict(fit_WB_MVN, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB_MVN, plot.est="Haz")
##D plot(pred_WB_MVN, plot.est="Surv")
##D 
##D 
##D #################
##D ## WEIBULL-DPM ##
##D #################
##D 
##D ##
##D myModel <- c("semi-Markov", "Weibull", "DPM")
##D myPath  <- "Output/04-Results-WB_DPM/"
##D 
##D startValues      <- initiate.startValues_HReg(form, scrData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_WB_DPM <- BayesID_HReg(form, scrData, id, model=myModel,
##D                     hyperParams, startValues, mcmc.WB, path=myPath)
##D 
##D fit_WB_DPM
##D summ.fit_WB_DPM <- summary(fit_WB_DPM); names(summ.fit_WB_DPM)
##D summ.fit_WB_DPM
##D pred_WB_DPM <- predict(fit_WB_MVN, tseq=seq(from=0, to=30, by=5))
##D plot(pred_WB_DPM, plot.est="Haz")
##D plot(pred_WB_DPM, plot.est="Surv")
##D 
##D #############
##D ## PEM-MVN ##
##D #############
##D 
##D ##
##D myModel <- c("semi-Markov", "PEM", "MVN")
##D myPath  <- "Output/05-Results-PEM_MVN/"
##D 
##D startValues      <- initiate.startValues_HReg(form, scrData, model=myModel, id, nChain=2)
##D 
##D ##
##D fit_PEM_MVN <- BayesID_HReg(form, scrData, id, model=myModel,
##D                     hyperParams, startValues, mcmc.PEM, path=myPath)
##D                     
##D fit_PEM_MVN
##D summ.fit_PEM_MVN <- summary(fit_PEM_MVN); names(summ.fit_PEM_MVN)
##D summ.fit_PEM_MVN
##D pred_PEM_MVN <- predict(fit_PEM_MVN)
##D plot(pred_PEM_MVN, plot.est="Haz")
##D plot(pred_PEM_MVN, plot.est="Surv")
##D 
##D #############
##D ## PEM-DPM ##
##D #############
##D 
##D ##
##D myModel <- c("semi-Markov", "PEM", "DPM")
##D myPath  <- "Output/06-Results-PEM_DPM/"
##D 
##D startValues      <- initiate.startValues_HReg(form, scrData, model=myModel, id, nChain=2)
##D                     
##D ##
##D fit_PEM_DPM <- BayesID_HReg(form, scrData, id, model=myModel,
##D                     hyperParams, startValues, mcmc.PEM, path=myPath)
##D                     
##D fit_PEM_DPM
##D summ.fit_PEM_DPM <- summary(fit_PEM_DPM); names(summ.fit_PEM_DPM)
##D summ.fit_PEM_DPM
##D pred_PEM_DPM <- predict(fit_PEM_DPM)
##D plot(pred_PEM_DPM, plot.est="Haz")
##D plot(pred_PEM_DPM, plot.est="Surv")
##D                     
## End(Not run)



