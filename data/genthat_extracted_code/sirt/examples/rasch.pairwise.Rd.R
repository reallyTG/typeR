library(sirt)


### Name: rasch.pairwise
### Title: Pairwise Estimation Method of the Rasch Model
### Aliases: rasch.pairwise summary.rasch.pairwise
### Keywords: Pairwise conditional maximum likelihood (PCML) Minchi method
###   summary

### ** Examples

#############################################################################
# EXAMPLE 1: Reading data set | pairwise estimation Rasch model
#############################################################################

data(data.read)

#*** Model 1: no constraint on item difficulties
mod1 <- sirt::rasch.pairwise( data.read )
summary(mod1)

#*** Model 2: sum constraint on item difficulties
mod2 <- sirt::rasch.pairwise( data.read, zerosum=TRUE)
summary(mod2)

## Not run: 
##D mod2$item$b   # extract item difficulties
##D 
##D # Bootstrap for item difficulties
##D boot_pw <- function(data, indices ){
##D         dd <- data[ indices, ] # bootstrap of indices
##D         mod <- sirt::rasch.pairwise( dd, zerosum=TRUE, progress=FALSE)
##D         mod$item$b
##D     }
##D set.seed(986)
##D library(boot)
##D dat <- data.read
##D bmod2 <- boot::boot( dat, boot_pw, R=999 )
##D bmod2
##D summary(bmod2)
##D # quantiles for bootstrap sample (and confidence interval)
##D apply( bmod2$t, 2, quantile, c(.025,.5, .975) )
## End(Not run)



