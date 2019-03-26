library(TAM)


### Name: IRT.truescore
### Title: Converts a theta Score into a True Score tau ( theta)
### Aliases: IRT.truescore
### Keywords: True scores

### ** Examples

#############################################################################
# EXAMPLE 1: True score conversion for a test with polytomous items
#############################################################################

data(data.Students, package="CDM")
dat <- data.Students[, paste0("mj",1:4) ]

# fit partial credit model
mod1 <- TAM::tam.mml( dat,control=list(maxiter=20) )
summary(mod1)

# true score conversion
tmod1 <- TAM::IRT.truescore( mod1 )
round( tmod1, 4 )
# true score conversion with user-defined theta grid
tmod1b <- TAM::IRT.truescore( mod1, theta=seq( -8,8, len=33 ) )
# plot results
plot( tmod1$theta, tmod1$truescore, type="l",
            xlab=expression(theta), ylab=expression(tau( theta ) ) )
points( tmod1b$theta, tmod1b$truescore, pch=16, col="brown" )

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: True scores with different category weightings
##D #############################################################################
##D 
##D data(data.timssAusTwn.scored)
##D dat <- data.timssAusTwn.scored
##D # extract item response data
##D dat <- dat[, grep("M03", colnames(dat) ) ]
##D # select items with do have maximum score of 2 (polytomous items)
##D ind <- which( apply( dat,  2, max, na.rm=TRUE )==2 )
##D I <- ncol(dat)
##D # define Q-matrix with scoring variant
##D Q <- matrix( 1, nrow=I, ncol=1 )
##D Q[ ind, 1 ] <- .5    # score of 0.5 for polyomous items
##D 
##D # estimate model
##D mod1 <- TAM::tam.mml( dat, Q=Q, irtmodel="PCM2", control=list( nodes=seq(-10,10,len=61) ) )
##D summary(mod1)
##D 
##D # true score with scoring (0,1,2) which is the default of the function
##D tmod1 <- TAM::IRT.truescore(mod1)
##D # true score with user specified weighting matrix
##D Q <- mod1$B[,,1]
##D tmod2 <- TAM::IRT.truescore(mod1, Q=Q)
## End(Not run)



