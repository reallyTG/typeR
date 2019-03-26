library(TAM)


### Name: IRT.drawPV
### Title: Function for Drawing Plausible Values
### Aliases: IRT.drawPV
### Keywords: Plausible value imputation

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Plausible value imputation for Rasch model in sirt
##D #############################################################################
##D 
##D library(sirt)
##D data(data.read,package="sirt")
##D dat <- data.read
##D 
##D # fit Rasch model
##D mod <- rasch.mml2(dat)
##D # draw 10 plausible values
##D pv1 <- TAM::IRT.drawPV(mod, NPV=10)
## End(Not run)



