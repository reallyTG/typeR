library(CDM)


### Name: personfit.appropriateness
### Title: Appropriateness Statistic for Person Fit Assessment
### Aliases: personfit.appropriateness summary.personfit.appropriateness
###   plot.personfit.appropriateness
### Keywords: Person fit summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: DINA model data.ecpe
#############################################################################

data(data.ecpe, package="CDM")

# fit DINA model
mod1 <- CDM::din( CDM::data.ecpe$data[,-1], q.matrix=CDM::data.ecpe$q.matrix )
summary(mod1)

# person fit appropriateness statistic
data <- mod1$data
probs <- mod1$pjk
skillclassprobs <- mod1$attribute.patt[,1]
res <- CDM::personfit.appropriateness( data, probs, skillclassprobs, maxiter=8)
                 # only few iterations
summary(res)
plot(res)

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Person fit 2PL model
##D #############################################################################
##D 
##D data(data.read, package="sirt")
##D dat <- data.read
##D I <- ncol(dat)
##D 
##D # fit 2PL model
##D mod1 <- sirt::rasch.mml2( dat, est.a=1:I)
##D # person fit statistic
##D data <- mod1$dat
##D probs0 <- t(mod1$pjk)
##D probs <- array( 0, dim=c( I, 2, dim(probs0)[2] ) )
##D probs[,2,] <- probs0
##D probs[,1,] <- 1 - probs0
##D skillclassprobs <- mod1$trait.distr$pi.k
##D res <- CDM::personfit.appropriateness( data, probs, skillclassprobs )
##D summary(res)
##D plot(res)
## End(Not run)



