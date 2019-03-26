library(immer)


### Name: immer_opcat
### Title: Estimation of Integer Item Discriminations
### Aliases: immer_opcat
### Keywords: Integer item discriminations OPLM

### ** Examples

#############################################################################
# EXAMPLE 1: Estimating integer item discriminations for dichotomous data
#############################################################################

library(sirt)
data(data.read, package="sirt")
dat <- data.read
I <- ncol(dat)

#--- estimate 2PL model
mod <- sirt::rasch.mml2( dat, est.a=1:I, mmliter=30)
summary(mod)
a <- mod$item$a        # extract (non-integer) item discriminations

#--- estimate integer item discriminations under different conditions
a1 <- immer::immer_opcat( a, hmean=3, min=1, max=6 )
table(a1)
a2 <- immer::immer_opcat( a, hmean=2, min=1, max=3 )
a3 <- immer::immer_opcat( a, hmean=1.5, min=1, max=2 )
#--- compare results
cbind( a, a1, a2, a3)



