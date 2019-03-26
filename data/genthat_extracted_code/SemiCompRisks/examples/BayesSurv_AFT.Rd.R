library(SemiCompRisks)


### Name: BayesSurv_AFT
### Title: The function to implement Bayesian parametric and
###   semi-parametric analyses for univariate survival data in the context
###   of accelerated failure time (AFT) models.
### Aliases: BayesSurv_AFT
### Keywords: Bayesian framework univariate analysis accelerated failure
###   time models

### ** Examples


## Not run: 
##D # loading a data set
##D data(survData)
##D survData$yL <- survData$yU <- survData[,1]
##D survData$yU[which(survData[,2] == 0)] <- Inf
##D survData$LT <- rep(0, dim(survData)[1])
##D 
##D form <- Formula(LT | yL + yU ~ cov1 + cov2)
##D 
##D #####################
##D ## Hyperparameters ##
##D #####################
##D 
##D ## log-Normal model
##D ##
##D LN.ab <- c(0.3, 0.3)
##D 
##D ## DPM model
##D ##
##D DPM.mu <- log(12)
##D DPM.sigSq <- 100
##D DPM.ab <-  c(2, 1)
##D Tau.ab <- c(1.5, 0.0125)
##D 
##D ##
##D hyperParams <- list(LN=list(LN.ab=LN.ab),
##D DPM=list(DPM.mu=DPM.mu, DPM.sigSq=DPM.sigSq, DPM.ab=DPM.ab, Tau.ab=Tau.ab))
##D 
##D ###################
##D ## MCMC SETTINGS ##
##D ###################
##D 
##D ## Setting for the overall run
##D ##
##D numReps    <- 100
##D thin       <- 1
##D burninPerc <- 0.5
##D 
##D ## Tuning parameters for specific updates
##D ##
##D ##  - those common to all models
##D beta.prop.var	<- 0.01
##D mu.prop.var	<- 0.1
##D zeta.prop.var	<- 0.1
##D 
##D ##
##D mcmcParams	<- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D tuning=list(beta.prop.var=beta.prop.var, mu.prop.var=mu.prop.var,
##D zeta.prop.var=zeta.prop.var))
##D 
##D ################################################################
##D ## Analysis of Independent univariate survival data ############
##D ################################################################
##D 
##D ###############
##D ## logNormal ##
##D ###############
##D 
##D ##
##D myModel <- "LN"
##D myPath  <- "Output/01-Results-LN/"
##D 
##D startValues      <- initiate.startValues_AFT(form, survData, model=myModel, nChain=2)
##D 
##D ##
##D fit_LN <- BayesSurv_AFT(form, survData, model=myModel, hyperParams,
##D startValues, mcmcParams, path=myPath)
##D 
##D fit_LN
##D summ.fit_LN <- summary(fit_LN); names(summ.fit_LN)
##D summ.fit_LN
##D pred_LN <- predict(fit_LN, time = seq(0, 35, 1), tseq=seq(from=0, to=30, by=5))
##D plot(pred_LN, plot.est="Haz")
##D plot(pred_LN, plot.est="Surv")
##D 
##D #########
##D ## DPM ##
##D #########
##D 
##D ##
##D myModel <- "DPM"
##D myPath  <- "Output/02-Results-DPM/"
##D 
##D startValues      <- initiate.startValues_AFT(form, survData, model=myModel, nChain=2)
##D 
##D ##
##D fit_DPM <- BayesSurv_AFT(form, survData, model=myModel, hyperParams,
##D startValues, mcmcParams, path=myPath)
##D 
##D fit_DPM
##D summ.fit_DPM <- summary(fit_DPM); names(summ.fit_DPM)
##D summ.fit_DPM
##D pred_DPM <- predict(fit_DPM, time = seq(0, 35, 1), tseq=seq(from=0, to=30, by=5))
##D plot(pred_DPM, plot.est="Haz")
##D plot(pred_DPM, plot.est="Surv")
## End(Not run)




