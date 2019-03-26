library(SemiCompRisks)


### Name: PPD
### Title: Function to predict the joint probability involving two event
###   times in Bayesian illness-death models
### Aliases: PPD
### Keywords: Bayesian framework semi-competing risks analysis hazard
###   regression models

### ** Examples

## Not run: 
##D    
##D # loading a data set
##D data(scrData)
##D id=scrData$cluster
##D 
##D form <- Formula(time1 + event1 | time2 + event2 ~ x1 + x2 | x1 + x2 | x1 + x2)
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
##D ##
##D hyperParams <- list(theta=theta.ab,
##D                    PEM=list(PEM.ab1=PEM.ab1, PEM.ab2=PEM.ab2, PEM.ab3=PEM.ab3,
##D                     PEM.alpha1=PEM.alpha1, PEM.alpha2=PEM.alpha2,
##D                     PEM.alpha3=PEM.alpha3))
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
##D 
##D ## Tuning parameters for specific updates
##D ##
##D ##  - those common to all models
##D mhProp_theta_var  <- 0.05
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
##D mcmc.PEM <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D                 storage=list(nGam_save=nGam_save),
##D                 tuning=list(mhProp_theta_var=mhProp_theta_var,
##D                 Cg=Cg, delPertg=delPertg,
##D                 rj.scheme=rj.scheme, Kg_max=Kg_max,
##D                 time_lambda1=time_lambda1, time_lambda2=time_lambda2,
##D                 time_lambda3=time_lambda3))
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
##D PPD(fit_PEM, x1=c(1,1), x2=c(1,1), x3=c(1,1), t1=3, t2=6)
##D 		
## End(Not run)



