library(sirt)


### Name: rasch.jml
### Title: Joint Maximum Likelihood (JML) Estimation of the Rasch Model
### Aliases: rasch.jml summary.rasch.jml
### Keywords: Joint maximum likelihood (JML) summary

### ** Examples

#############################################################################
# EXAMPLE 1: Simulated data from the Rasch model
#############################################################################
set.seed(789)
N <- 500    # number of persons
I <- 11     # number of items
b <- seq( -2, 2, length=I )
dat <- sirt::sim.raschtype( stats::rnorm( N ), b )
colnames(dat) <- paste( "I", 1:I, sep="")

# JML estimation of the Rasch model
mod1 <- sirt::rasch.jml( dat )
summary(mod1)

# MML estimation with rasch.mml2 function
mod2 <- sirt::rasch.mml2( dat )
summary(mod2)

# Pairwise method of Fischer
mod3 <- sirt::rasch.pairwise( dat )
summary(mod3)

# JML estimation in TAM
## Not run: 
##D library(TAM)
##D mod4 <- TAM::tam.jml2( resp=dat )
##D 
##D # JML estimation in mixRasch package
##D library(mixRasch)
##D mod5 <- mixRasch::mixRasch( dat, steps=1, n.c=1, max.iter=50)
##D print(mod5)
##D mod5$item.par       # extract item parameters
##D 
##D #******
##D # item parameter constraints in JML estimation
##D # fix item difficulties: b[4]=-.76 and b[6]=.10
##D constraints <- matrix( cbind( 4, -.76,
##D                               6, .10 ),
##D                   ncol=2, byrow=TRUE )
##D mod6 <- sirt::rasch.jml( dat, constraints=constraints )
##D summary(mod6)
##D   # For constrained item parameters, it this not obvious
##D   # how to calculate a 'right correction' of item parameter bias
## End(Not run)



