library(sirt)


### Name: np.dich
### Title: Nonparametric Estimation of Item Response Functions
### Aliases: np.dich
### Keywords: Nonparametric item response theory

### ** Examples

#############################################################################
# EXAMPLE 1: Reading dataset
#############################################################################
data( data.read )
dat <- data.read

# estimate Rasch model
mod <- sirt::rasch.mml2( dat )
# WLE estimation
wle1 <- sirt::wle.rasch( dat=dat, b=mod$item$b )$theta
# nonparametric function estimation
np1 <- sirt::np.dich( dat=dat, theta=wle1, thetagrid=seq(-2.5, 2.5, len=100 ) )
print( str(np1))
# plot nonparametric item response curves
plot( np1, b=mod$item$b )



