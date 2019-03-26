## ----message=FALSE-------------------------------------------------------
library(sgmcmc)
library(MASS)
# Declare number of observations
N = 10^4
# Set theta to be 0 and simulate the data
theta = c( 0, 0 )
Sigma = diag(2)
set.seed(13)
X = mvrnorm( N, theta, Sigma )
dataset = list("X" = X)

## ------------------------------------------------------------------------
params = list( "theta" = c( 0, 0 ) )

## ------------------------------------------------------------------------
logLik = function( params, dataset ) {
    # Declare distribution of each observation
    SigmaDiag = c( 1, 1 )
    baseDist = tf$distributions$MultivariateNormalDiag( params$theta, SigmaDiag )
    # Declare log-likelihood function and return
    logLik = tf$reduce_sum( baseDist$log_prob( dataset$X ) )
    return( logLik )
}

## ------------------------------------------------------------------------
logPrior = function( params ) {
    baseDist = tf$distributions$Normal( 0, 10 )
    logPrior = tf$reduce_sum( baseDist$log_prob( params$theta ) )
    return( logPrior )
}

## ------------------------------------------------------------------------
stepsize = list( "theta" = 1e-5 )
n = 100

## ----eval=FALSE----------------------------------------------------------
#  chains = sgld( logLik, dataset, params, stepsize, logPrior = logPrior, minibatchSize = n,
#                verbose = FALSE, seed = 13 )

## ----echo=FALSE----------------------------------------------------------
tryCatch({
chains = sgld( logLik, dataset, params, stepsize, logPrior = logPrior, minibatchSize = n, 
              verbose = FALSE, seed = 13 )
}, error = function (e) { 
    writeLines("Not all tensorflow dependencies are met so skipping this...")
    writeLines("Try running tensorflow::install_tensorflow().")
})

## ----eval=FALSE----------------------------------------------------------
#  library(ggplot2)
#  burnIn = 10^3
#  thetaOut = as.data.frame( chains$theta[-c(1:burnIn),] )
#  ggplot( thetaOut, aes( x = V1, y = V2 ) ) +
#      stat_density2d( size = 1.5 )

## ----echo=FALSE----------------------------------------------------------
tryCatch({
    a = tf$constant(c(1, 1))
    library(ggplot2)
    burnIn = 10^3
    thetaOut = as.data.frame( chains$theta[-c(1:burnIn),] )
    ggplot( thetaOut, aes( x = V1, y = V2 ) ) +
        stat_density2d( size = 1.5 )
}, error = function (e) { 
    writeLines("Not all tensorflow dependencies are met so skipping this...")
    writeLines("Try running tensorflow::install_tensorflow().")
})

