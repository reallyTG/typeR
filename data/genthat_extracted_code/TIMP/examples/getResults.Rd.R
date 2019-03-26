library(TIMP)


### Name: getResults
### Title: Functions to print and return parts of the object returned by
###   the fitting routines.
### Aliases: getResults onls sumnls parEst getCLPList getData getSVDData
###   getSVDResiduals getTraces getdim1 getdim2 getResiduals
###   getSVDResiduals getXList getX getC getCLP getDAS
### Keywords: file

### ** Examples


## Not run: 
##D 
##D ## Example showing the addition of non-negativity constraints to 
##D ## conditionally linear parameters (here the spectra associated with
##D ## a kinetic model)
##D 
##D ## For the 1st simulated dataset, the constraints offer a modest improvement
##D ## in the estimated spectra, whereas for the 2nd simulated dataset, they
##D ## prevent a catastrophe in which the estimated components are hugely
##D ## compensating. 
##D 
##D ##############################
##D ## load TIMP
##D ##############################
##D 
##D require(TIMP)
##D 
##D ##############################
##D ## set random seed for reproducability of noise
##D ##############################
##D 
##D set.seed(80)
##D 
##D ##############################
##D ## SIMULATE DATA, noise realization 1
##D ##############################
##D 
##D  dt4 <- simndecay_gen(kinpar = c(.4, .8, 2), seqmod = FALSE, tmax
##D      = 2, deltat = .04, specpar = list(c(25000, 3000, .01), c(22000,
##D      3000, .01), c(18000, 3000, .01)), lmin=350, lmax=550, deltal = 2,
##D      sigma=.01)
##D 
##D ##############################
##D ## SPECIFY INITIAL MODEL
##D ##############################
##D 
##D mod1 <- initModel(mod_type = "kin", kinpar = c(.4, .8, 2),
##D seqmod=FALSE)
##D 
##D ##############################
##D ## FIT INITIAL MODEL
##D ##############################
##D 
##D sT <- fitModel(list(dt4), list(mod1), opt=kinopt(iter=50, plot=FALSE))
##D 
##D ##############################
##D ## EXTRACT ESTIMATED SPECTRA 
##D ## these spectra have some negative values
##D ############################## 
##D                                    
##D sTcp <- getCLP(sT)
##D 
##D ## plot the estimated spectra with the values used in
##D ## simulation  (before adding noise) for comparison 
##D  matplot(dt4@x2, sTcp, xlab = "wavelength (nm)", col = 2:4, type="l",
##D         ylab="",lty=1, main =
##D         paste("Estimated spectra, adding no constraints\n"))
##D  matplot(dt4@x2,dt4@E2, add=TRUE, type="l", col=1, lty=2)
##D  abline(0,0)
##D 
##D 
##D ##############################
##D ## FIT INITIAL MODEL 
##D ## adding constraints to non-negativity of the
##D ## spectra via the opt option nnls=TRUE
##D ##############################
##D 
##D sV <- fitModel(list(dt4), list(mod1), opt=kinopt(iter=50, nnls=TRUE,
##D                                         plot=FALSE))
##D 
##D ##############################
##D ## EXTRACT ESTIMATED SPECTRA 
##D ## these spectra have no negative values
##D ############################## 
##D                                    
##D sVcp <- getCLP(sV)
##D 
##D ## plot the estimated spectra with the values used in
##D ## simulation  (before adding noise) for comparison 
##D  matplot(dt4@x2, sVcp, xlab = "wavelength (nm)", col = 2:4, type="l",
##D  ylab="",lty=1,
##D          main = paste("Estimated spectra, with non-negativity constraints\n"))
##D  matplot(dt4@x2,dt4@E2, add=TRUE, type="l", col=1, lty=2)
##D  abline(0,0)
##D 
##D ##############################
##D ## SIMULATE DATA, noise realization 2
##D ##############################
##D 
##D  dt4_2 <- simndecay_gen(kinpar = c(.4, .8, 2), seqmod = FALSE, tmax
##D      = 2, deltat = .04, specpar = list(c(25000, 3000, .01), c(22000,
##D      3000, .01), c(18000, 3000, .01)), lmin=350, lmax=550, deltal = 2,
##D      sigma=.01)
##D 
##D ##############################
##D ## SPECIFY INITIAL MODEL
##D ##############################
##D 
##D mod1 <- initModel(mod_type = "kin", kinpar = c(.4, .8, 2),
##D seqmod=FALSE)
##D 
##D ##############################
##D ## FIT INITIAL MODEL
##D ##############################
##D 
##D sT <- fitModel(list(dt4_2), list(mod1), opt=kinopt(iter=50,plot=FALSE))
##D     
##D ##############################
##D ## EXTRACT ESTIMATED SPECTRA 
##D ## these spectra have some negative values
##D ############################## 
##D                                    
##D sTcp <- getCLP(sT)
##D 
##D ## plot the estimated spectra with the values used in
##D ## simulation (before adding noise) for comparison 
##D  matplot(dt4@x2, sTcp, xlab = "wavelength (nm)", col = 2:4, type="l",
##D         ylab="",lty=1, main =
##D         paste("Estimated spectra, adding no constraints\n"))
##D  matplot(dt4@x2,dt4@E2, add=TRUE, type="l", col=1, lty=2)
##D  abline(0,0)
##D 
##D ##############################
##D ## FIT INITIAL MODEL 
##D ## adding constraints to non-negativity of the
##D ## spectra via the opt option nnls=TRUE
##D ##############################
##D 
##D sV <- fitModel(list(dt4_2), list(mod1), opt=kinopt(iter=50, nnls=TRUE,
##D                                           plot=FALSE))
##D 
##D ##############################
##D ## EXTRACT ESTIMATED SPECTRA 
##D ## these spectra have no negative values
##D ############################## 
##D                                    
##D sVcp <- getCLP(sV)
##D 
##D ## plot the estimated spectra with the values used in
##D ## simulation (before adding noise) for comparison 
##D  matplot(dt4@x2, sVcp, xlab = "wavelength (nm)", col = 2:4, type="l",
##D  ylab="",lty=1,
##D          main = paste("Estimated spectra, with non-negativity constraints\n"))
##D  matplot(dt4@x2,dt4@E2, add=TRUE, type="l", col=1, lty=2)
##D  abline(0,0)
##D 
## End(Not run)



