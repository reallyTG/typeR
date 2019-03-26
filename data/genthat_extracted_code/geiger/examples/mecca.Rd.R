library(geiger)


### Name: mecca
### Title: running a MECCA analysis
### Aliases: mecca

### ** Examples

## Not run: 
##D data(carnivores)
##D phy <- carnivores$phy
##D data <- carnivores$dat
##D richness <- data[,1]
##D names(richness) <- rownames(data)
##D 
##D priors <- list(priorSigma = c(-4.5, 4.5), priorMean = c(-5, 2))
##D 
##D ## CALIBRATION (far too short for a real analysis)
##D Cal <- calibrate.mecca(phy, richness, model = "BM", prior.list = priors, Ncalibrations = 1000)
##D 
##D params <- Cal$trait[, c(1,2)] ## extract the calibration BM parameters
##D stats <- Cal$trait[, -c(1,2)] ## extract the calibration summary stats
##D 
##D ## now we run pls, determining combinations of summaries that explain variation in our parameters
##D ## For BM, 2 components is sufficient. For more complex models, more componenets will be required.
##D require(pls)
##D myPlsr<-pls::plsr(as.matrix(params) ~ as.matrix(stats), scale=F, ncomp = 2)
##D 
##D plot(RMSEP(myPlsr)) ## Look at Root Mean Square error plots
##D 
##D summary(myPlsr) ## take a look at ##D 
##D 
##D plsdat <- myPlsr$loadings
##D 
##D ## extract means and variances from the carnivore data ##
##D 
##D cladeMean<-data[,2]
##D names(cladeMean)<-rownames(data)
##D cladeVariance<-data[,3]
##D names(cladeVariance)<-rownames(data)
##D 
##D ## STARTING POINT
##D ## And now we can compute starting values for the ABC-MCMC
##D start <- startingpt.mecca(Cal, phy, cladeMean, cladeVariance,
##D tolerance = 0.05, plsdat, BoxCox = TRUE)
##D 
##D 
##D ## MECCA (far too short for a real analysis)
##D mecca(phy, richness, cladeMean, cladeVariance, model = "BM", prior.list = priors, start = start,
##D    Ngens = 1000, printFreq = 100, sigmaPriorType = "uniform", rootPriorType = "uniform",
##D    SigmaBounds = c(-4.5, 4.5), divPropWidth = 0.1, scale = 2, divSampleFreq = 0, BoxCox = TRUE,
##D    outputName ="MeccaBM.txt")
##D 
##D ## PASTE UNCOMMENTED FOLLOWING LINE TO DROP FILES CREATED BY MECCA
##D  # unlink(dir(pattern=paste(r)),recursive=TRUE)
##D 
## End(Not run)



