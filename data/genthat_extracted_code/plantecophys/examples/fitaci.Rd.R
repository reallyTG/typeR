library(plantecophys)


### Name: fitaci
### Title: Fit the Farquhar-Berry-von Caemmerer model of leaf
###   photosynthesis
### Aliases: fitaci plot.acifit

### ** Examples

## Not run: 
##D # Fit an A-Ci curve on a dataframe that contains Ci, Photo and optionally Tleaf and PPFD. 
##D # Here, we use the built-in example dataset 'acidata1'.
##D f <- fitaci(acidata1)
##D 
##D # Note that the default behaviour is to correct Vcmax and Jmax for temperature, 
##D # so the estimated values are at 25C. To turn this off:
##D f2 <- fitaci(acidata1, Tcorrect=FALSE)
##D 
##D # To use different T response parameters (see ?Photosyn),
##D f3 <- fitaci(acidata1, Tcorrect=TRUE, EaV=25000)
##D 
##D # Make a standard plot
##D plot(f)
##D 
##D # Look at a summary of the fit
##D summary(f)
##D 
##D # Extract coefficients only
##D coef(f)
##D 
##D # The object 'f' also contains the original data with predictions.
##D # Here, Amodel are the modelled (fitted) values, Ameas are the measured values.
##D with(f$df, plot(Amodel, Ameas))
##D abline(0,1)
##D 
##D # The fitted values can also be extracted with the fitted() function:
##D fitted(f)
##D 
##D # The non-linear regression (nls) fit is stored as well,
##D summary(f$nlsfit)
##D 
##D # Many more details can be extracted with the nlstools package
##D library(nlstools)
##D overview(f$nlsfit)
##D  
##D # The curve generator is stored as f$Photosyn:
##D # Calculate photosynthesis at some value for Ci, using estimated 
##D # parameters and mean Tleaf, PPFD for the dataset.
##D f$Photosyn(Ci=820)
##D 
##D # Photosynthetic rate at the transition point:
##D f$Photosyn(Ci=f$Ci_transition)$ALEAF
##D 
##D # Set the transition point; this will fit Vcmax and Jmax separately. Note that the *actual* 
##D # transition is quite different from that provided, this is perfectly fine : 
##D # in this case Jmax is estimated from the latter 3 points only (Ci>800), but the actual 
##D # transition point is at ca. 400ppm.
##D g <- fitaci(acidata1, citransition=800)
##D plot(g)
##D g$Ci_transition
##D 
##D # Use measured Rd instead of estimating it from the A-Ci curve. 
##D # The Rd measurement must be added to the dataset used in fitting, 
##D # and you must set useRd=TRUE.
##D acidata1$Rd <- 2
##D f2 <- fitaci(acidata1, useRd=TRUE)
##D f2
##D 
##D # Fit TPU limitation
##D ftpu <- fitaci(acidata1, fitTPU=TRUE, PPFD=1800, Tcorrect=TRUE)
##D plot(ftpu)
## End(Not run)



