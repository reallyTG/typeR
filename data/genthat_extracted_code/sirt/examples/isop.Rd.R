library(sirt)


### Name: isop
### Title: Fit Unidimensional ISOP and ADISOP Model to Dichotomous and
###   Polytomous Item Responses
### Aliases: isop.dich isop.poly summary.isop plot.isop
### Keywords: ISOP model ADISOP model Nonparametric IRT summary plot

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Reading (dichotomous items)
#############################################################################

data(data.read)
dat <- as.matrix( data.read)
I <- ncol(dat)

# Model 1: ISOP Model (11 score groups)
mod1 <- sirt::isop.dich( dat )
summary(mod1)
plot(mod1)

## Not run: 
##D # Model 2: ISOP Model (5 score groups)
##D score.breaks <- seq( -.005, 1.005, len=5+1 )
##D mod2 <- sirt::isop.dich( dat, score.breaks=score.breaks)
##D summary(mod2)
##D 
##D #############################################################################
##D # EXAMPLE 2: Dataset PISA mathematics (dichotomous items)
##D #############################################################################
##D 
##D data(data.pisaMath)
##D dat <- data.pisaMath$data
##D dat <- dat[, grep("M", colnames(dat) ) ]
##D 
##D # fit ISOP model
##D # Note that for this model many iterations are needed
##D #   to reach convergence for ADISOP
##D mod1 <- sirt::isop.dich( dat, maxit=4000)
##D summary(mod1)
## End(Not run)

#############################################################################
# EXAMPLE 3: Dataset Students (polytomous items)
#############################################################################

# Dataset students: scale cultural activities
library(CDM)
data(data.Students, package="CDM")
dat <- stats::na.omit( data.Students[, paste0("act",1:4) ] )

# fit models
mod1 <- sirt::isop.poly( dat )
summary(mod1)
plot(mod1)



