library(ePCR)


### Name: PEP-class
### Title: Penalized Ensemble Predictor (PEP) S4-class ensemble consisting
###   of individual PSP-members
### Aliases: PEP-class

### ** Examples

## Not run: 
##D # The PEP-construction is wrapped in NOT RUN, because cross-validating multiple PSPs
##D # is very time consuming especially if a tight grid of alpha/lambda is to be explored.
##D # The simulated data from Turku University Hospital (TYKS) is used as an example:
##D data(TYKSSIMU)
##D 
##D # Two cohorts and corresponding data matrices:
##D head(xMEDISIMU)
##D head(xTEXTSIMU)
##D # Two survival responses:
##D head(yMEDISIMU)
##D head(xTEXTSIMU)
##D 
##D # Search L1/L2 norm alpha-grid with 10 values between [0,1]
##D aseq <- seq(from=0, to=1, by=0.1)
##D # Lambda sequence penalization is of 100 length conditional for each alpha
##D nlamb <- 100
##D 
##D library(survival)
##D # Create three ensemble members; one for MEDI cohort, one for TEXT cohort,
##D # and finally one member that combines both cohorts simultaneously in a coxnet
##D psp1 <- new("PSP", x = rbind(xMEDISIMU, xTEXTSIMU), 
##D y = Surv(rbind(yMEDISIMU, yTEXTSIMU)[,"surv"]),
##D plot = TRUE, alphaseq = aseq, scorefunc = score.cindex, seed = 1,
##D folds = 10, nlambda = nlamb)
##D psp2 <- new("PSP", x = xMEDISIMU, 
##D y = Surv(yMEDISIMU[,"surv"]),
##D plot = TRUE, alphaseq = aseq, scorefunc = score.cindex, seed = 1,
##D folds = 10, nlambda = nlamb)
##D psp3 <- new("PSP", x = xTEXTSIMU, 
##D 	y = Surv(yTEXTSIMU[,"surv"]),
##D plot = TRUE, alphaseq = aseq, scorefunc = score.cindex, seed = 1,
##D folds = 10, nlambda = nlamb)
##D par(mfrow=c(1,3))
##D plot(psp1); plot(psp2); plot(psp3); # Inspect the alpha/lambda surfaces
##D 
##D # Create an ensemble of the above 3 members
##D simuens <- new("PEP", PSPs = list(psp1, psp2, psp3))
##D simuens
##D # Ready PEP-object can be used for novel predictions etc
##D 
## End(Not run)

# Run example predictions from a previously optimized PEP-model
data(ePCRmodels)
data(TYKSSIMU)

# Perform risk predictions from the joint cohort ensemble member as an example
MEDIpred <- predict(TYKS@PSPs[[1]]@fit, s=TYKS@PSPs[[1]]@optimum["Lambda"], 
newx = conforminput(TYKS@PSPs[[1]], xMEDISIMU))[,1]
TEXTpred <- predict(TYKS@PSPs[[1]]@fit, s=TYKS@PSPs[[1]]@optimum["Lambda"], 
newx = conforminput(TYKS@PSPs[[1]], xTEXTSIMU))[,1]

# Risk scores obtained for the new patients (arbitrary unit as per Cox regression)
head(MEDIpred)
head(TEXTpred)




