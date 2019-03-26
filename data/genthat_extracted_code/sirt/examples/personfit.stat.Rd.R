library(sirt)


### Name: personfit.stat
### Title: Person Fit Statistics for the Rasch Model
### Aliases: personfit.stat
### Keywords: Person fit

### ** Examples

#############################################################################
# EXAMPLE 1: Person fit Reading Data
#############################################################################

data(data.read)
dat <- data.read

# estimate Rasch model
mod <- sirt::rasch.mml2( dat )
# WLE
wle1 <- sirt::wle.rasch( dat,b=mod$item$b )$theta
b <- mod$item$b # item difficulty

# evaluate person fit
pf1 <- sirt::personfit.stat( dat=dat, abil=wle1, b=b)

## Not run: 
##D # dimensional analysis of person fit statistics
##D x0 <- stats::na.omit(pf1[, -c(1:3) ] )
##D stats::factanal( x=x0, factors=2, rotation="promax" )
##D   ## Loadings:
##D   ##                Factor1 Factor2
##D   ## caution         0.914
##D   ## depend          0.293   0.750
##D   ## ECI1            0.869   0.160
##D   ## ECI2            0.869   0.162
##D   ## ECI3            1.011
##D   ## ECI4            1.159  -0.269
##D   ## ECI5            1.012
##D   ## ECI6            0.879   0.130
##D   ## l0              0.409  -1.255
##D   ## lz             -0.504  -0.529
##D   ## outfit          0.297   0.702
##D   ## infit           0.362   0.695
##D   ## rpbis          -1.014
##D   ## rpbis.itemdiff  1.032
##D   ## U3              0.735   0.309
##D   ##
##D   ## Factor Correlations:
##D   ##         Factor1 Factor2
##D   ## Factor1   1.000  -0.727
##D   ## Factor2  -0.727   1.000
##D   ##
## End(Not run)



