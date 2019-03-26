library(immer)


### Name: immer_ccml
### Title: Composite Conditional Maximum Likelihood Estimation for the
###   Partial Credit Model with a Design Matrix for Item Parameters
### Aliases: immer_ccml summary.immer_ccml coef.immer_ccml vcov.immer_ccml

### ** Examples

#############################################################################
# EXAMPLE 1: Partial credit model with CCML estimation
#############################################################################

library(TAM)

data(data.gpcm, package="TAM")
dat <- data.gpcm

#-- initial MML estimation in TAM to create a design matrix
mod1a <- TAM::tam.mml(dat, irtmodel="PCM2")
summary(mod1a)

#* define design matrix
A <- - mod1a$A[,-1,-1]
A <- A[,,-1]
str(A)

#-- estimate model
mod1b <- immer::immer_ccml( dat, A=A)
summary(mod1b)



