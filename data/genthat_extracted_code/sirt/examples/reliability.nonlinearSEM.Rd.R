library(sirt)


### Name: reliability.nonlinearSEM
### Title: Estimation of Reliability for Confirmatory Factor Analyses Based
###   on Dichotomous Data
### Aliases: reliability.nonlinearSEM
### Keywords: Reliability

### ** Examples

#############################################################################
# EXAMPLE 1: Reading data set
#############################################################################
data(data.read)
dat <- data.read
I <- ncol(dat)

# define item clusters
itemcluster <- rep( 1:3, each=4)
error.corr <- diag(1,ncol(dat))
for ( ii in 1:3){
    ind.ii <- which( itemcluster==ii )
    error.corr[ ind.ii, ind.ii ] <- ii
        }
# estimate the model with error correlations
mod1 <- sirt::rasch.pml3( dat, error.corr=error.corr)
summary(mod1)

# extract item parameters
thresh <- - matrix( mod1$item$a * mod1$item$b, I, 1 )
A <- matrix( mod1$item$a * mod1$item$sigma, I, 1 )
# extract estimated correlation matrix
corM <- mod1$eps.corrM
# compute standardized factor loadings
facA <- 1 / sqrt( A^2 + 1 )
resvar <- 1 - facA^2
covM <- outer( sqrt(resvar[,1]), sqrt(resvar[,1] ) ) * corM
facloadings <- A *facA

# estimate reliability
rel1 <- sirt::reliability.nonlinearSEM( facloadings=facloadings, thresh=thresh,
           resid.cov=covM)
rel1$omega.rel



