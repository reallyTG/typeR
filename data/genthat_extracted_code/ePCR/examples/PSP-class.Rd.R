library(ePCR)


### Name: PSP-class
### Title: Penalized Single Predictor (PSP) S4-class as a member of
###   PEP-ensembles
### Aliases: PSP-class

### ** Examples

# As an example, illustrate a naive PSP built on the small medication cohort
data(TYKSSIMU)
library(survival)
# Minimal example with much fewer patients and variables
psp_ex <- new("PSP", alphaseq=c(0.2, 0.8), nlambda=20, folds=3,
	x = xMEDISIMU[1:80,c(1:20,40:50)], y = yMEDISIMU[1:80,"surv"],
seeds = 1, score=score.cindex)

plot(psp_ex) # Optimization surface of alpha/lambda

# Illustrate the use of some PSP-methods:
PSP.KM(psp_ex, cutoff = 0.5) # Kaplan-Meier
PSP.PCA(psp_ex) # PCA plot of training data
PSP.BOX(psp_ex) # Boxplots, here for the first training variable
PSP.CSP(psp_ex) # Cumulative survival probabilities for the training data
PSP.NA(psp_ex) # Time-to-event Nelson-Aalen heuristic algorithm

## Not run: 
##D # Computationally intensive novel PSP-fitting is omitted from the test runs
##D # Functions for readily fitted PSP-objects are illustrated above
##D data(TYKSSIMU)
##D library(survival)
##D psp_meditext <- new("PSP", x = rbind(xMEDISIMU, xTEXTSIMU), 
##D y = Surv(rbind(yMEDISIMU, yTEXTSIMU)[,"surv"]),
##D plot = TRUE, alphaseq = seq(0, 1, by=.01), scorefunc = score.cindex, 
##D seed = 1, folds = 10, nlambda = 100)
##D plot(psp_meditext)
## End(Not run)



