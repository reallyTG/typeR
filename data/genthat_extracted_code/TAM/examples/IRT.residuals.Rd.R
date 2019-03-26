library(TAM)


### Name: IRT.residuals
### Title: Residuals in an IRT Model
### Aliases: IRT.residuals IRT.residuals.tam.jml IRT.residuals.tam.mml
###   IRT.residuals.tam.mml.2pl IRT.residuals.tam.mml.mfr residuals.tam.jml
###   residuals.tam.mml residuals.tam.mml.2pl residuals.tam.mml.mfr
### Keywords: Residuals

### ** Examples

#############################################################################
# EXAMPLE 1: Residuals data.read
#############################################################################

library(sirt)
data(data.read,package="sirt")
dat <- data.read

# for Rasch model
mod <- TAM::tam.mml( dat )
# extract residuals
res <- TAM::IRT.residuals( mod )
str(res)



