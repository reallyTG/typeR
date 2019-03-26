library(SemiCompRisks)


### Name: BayesID_AFT
### Title: The function to implement Bayesian parametric and
###   semi-parametric analyses for semi-competing risks data in the context
###   of accelerated failure time (AFT) models.
### Aliases: BayesID_AFT
### Keywords: Bayesian framework semi-competing risks analysis accelerated
###   failure time models

### ** Examples


## Not run: 
##D # loading a data set
##D data(scrData)
##D scrData$y1L <- scrData$y1U <- scrData[,1]
##D scrData$y1U[which(scrData[,2] == 0)] <- Inf
##D scrData$y2L <- scrData$y2U <- scrData[,3]
##D scrData$y2U[which(scrData[,4] == 0)] <- Inf
##D scrData$LT <- rep(0, dim(scrData)[1])
##D 
##D form <- Formula(LT | y1L + y1U | y2L + y2U  ~ x1 + x2 + x3 | x1 + x2 | x1 + x2)
##D 
##D #####################
##D ## Hyperparameters ##
##D #####################
##D 
##D ## Subject-specific random effects variance component
##D ##
##D theta.ab <- c(0.5, 0.05)
##D 
##D ## log-Normal model
##D ##
##D LN.ab1 <- c(0.3, 0.3)
##D LN.ab2 <- c(0.3, 0.3)
##D LN.ab3 <- c(0.3, 0.3)
##D 
##D ## DPM model
##D ##
##D DPM.mu1 <- log(12)
##D DPM.mu2 <- log(12)
##D DPM.mu3 <- log(12)
##D 
##D DPM.sigSq1 <- 100
##D DPM.sigSq2 <- 100
##D DPM.sigSq3 <- 100
##D 
##D DPM.ab1 <-  c(2, 1)
##D DPM.ab2 <-  c(2, 1)
##D DPM.ab3 <-  c(2, 1)
##D 
##D Tau.ab1 <- c(1.5, 0.0125)
##D Tau.ab2 <- c(1.5, 0.0125)
##D Tau.ab3 <- c(1.5, 0.0125)
##D 
##D ##
##D hyperParams <- list(theta=theta.ab,
##D LN=list(LN.ab1=LN.ab1, LN.ab2=LN.ab2, LN.ab3=LN.ab3),
##D DPM=list(DPM.mu1=DPM.mu1, DPM.mu2=DPM.mu2, DPM.mu3=DPM.mu3, DPM.sigSq1=DPM.sigSq1,
##D DPM.sigSq2=DPM.sigSq2, DPM.sigSq3=DPM.sigSq3, DPM.ab1=DPM.ab1, DPM.ab2=DPM.ab2,
##D DPM.ab3=DPM.ab3, Tau.ab1=Tau.ab1, Tau.ab2=Tau.ab2, Tau.ab3=Tau.ab3))
##D 
##D ###################
##D ## MCMC SETTINGS ##
##D ###################
##D 
##D ## Setting for the overall run
##D ##
##D numReps    <- 300
##D thin       <- 3
##D burninPerc <- 0.5
##D 
##D ## Setting for storage
##D ##
##D nGam_save <- 10
##D nY1_save <- 10
##D nY2_save <- 10
##D nY1.NA_save <- 10
##D 
##D ## Tuning parameters for specific updates
##D ##
##D ##  - those common to all models
##D betag.prop.var	<- c(0.01,0.01,0.01)
##D mug.prop.var	<- c(0.1,0.1,0.1)
##D zetag.prop.var	<- c(0.1,0.1,0.1)
##D gamma.prop.var	<- 0.01
##D 
##D ##
##D mcmcParams	<- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
##D storage=list(nGam_save=nGam_save, nY1_save=nY1_save, nY2_save=nY2_save, nY1.NA_save=nY1.NA_save),
##D tuning=list(betag.prop.var=betag.prop.var, mug.prop.var=mug.prop.var,
##D zetag.prop.var=zetag.prop.var, gamma.prop.var=gamma.prop.var))
##D 
##D #################################################################
##D ## Analysis of Independent Semi-competing risks data ############
##D #################################################################
##D 
##D ###############
##D ## logNormal ##
##D ###############
##D 
##D ##
##D myModel <- "LN"
##D myPath  <- "Output/01-Results-LN/"
##D 
##D startValues      <- initiate.startValues_AFT(form, scrData, model=myModel, nChain=2)
##D 
##D ##
##D fit_LN <- BayesID_AFT(form, scrData, model=myModel, hyperParams,
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
##D startValues      <- initiate.startValues_AFT(form, scrData, model=myModel, nChain=2)
##D 
##D ##
##D fit_DPM <- BayesID_AFT(form, scrData, model=myModel, hyperParams,
##D startValues, mcmcParams, path=myPath)
##D 
##D fit_DPM
##D summ.fit_DPM <- summary(fit_DPM); names(summ.fit_DPM)
##D summ.fit_DPM
##D pred_DPM <- predict(fit_DPM, time = seq(0, 35, 1), tseq=seq(from=0, to=30, by=5))
##D plot(pred_DPM, plot.est="Haz")
##D plot(pred_DPM, plot.est="Surv")
## End(Not run)




