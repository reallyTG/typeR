library(immer)


### Name: immer_jml
### Title: Joint Maximum Likelihood Estimation for the Partial Credit Model
###   with a Design Matrix for Item Parameters and \varepsilon-Adjustment
###   Bias Correction
### Aliases: immer_jml summary.immer_jml IRT.likelihood.immer_jml
###   logLik.immer_jml

### ** Examples

#############################################################################
# EXAMPLE 1: Rasch model
#############################################################################

data(data.read, package="sirt")
dat <- data.read

#---  Model 1: Rasch model with JML and epsilon-adjustment
mod1a <- immer::immer_jml(dat)
summary(mod1a)

## Not run: 
##D #- JML estimation, only handling extreme scores
##D mod1b <- immer::immer_jml( dat, est_method="jml")
##D summary(mod1b)
##D 
##D #- JML estimation with (I-1)/I bias correction
##D mod1c <- immer::immer_jml( dat, est_method="jml_bc" )
##D summary(mod1c)
##D 
##D # compare different estimators
##D round( cbind( eps=mod1a$xsi, JML=mod1b$xsi, BC=mod1c$xsi ), 2 )
##D 
##D #---  Model 2: LLTM by defining a design matrix for item difficulties
##D A <- array(0, dim=c(12,1,3) )
##D A[1:4,1,1] <- 1
##D A[5:8,1,2] <- 1
##D A[9:12,1,3] <- 1
##D 
##D mod2 <- immer::immer_jml(dat, A=A)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Partial credit model
##D #############################################################################
##D 
##D library(TAM)
##D data(data.gpcm, package="TAM")
##D dat <- data.gpcm
##D 
##D #-- JML estimation in TAM
##D mod0 <- TAM::tam.jml(resp=dat, bias=FALSE)
##D summary(mod0)
##D 
##D # extract design matrix
##D A <- mod0$A
##D A <- A[,-1,]
##D 
##D #-- JML estimation
##D mod1 <- immer::immer_jml(dat, A=A, est_method="jml")
##D summary(mod1)
##D 
##D #-- JML estimation with epsilon-adjusted bias correction
##D mod2 <- immer::immer_jml(dat, A=A, est_method="eps_adj")
##D summary(mod2)
## End(Not run)



