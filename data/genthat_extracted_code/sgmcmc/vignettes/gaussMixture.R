## ----message=FALSE-------------------------------------------------------
library(sgmcmc)
library(MASS)
# Declare number of observations
N = 10^4
# Set locations of two modes, theta1 and theta2
theta1 = c( 0, 0 )
theta2 = c( 0.1, 0.1 )
# Allocate observations to each component
set.seed(13)
z = sample( 2, N, replace = TRUE, prob = c( 0.5, 0.5 ) )
# Predeclare data matrix
X = matrix( rep( NA, 2*N ), ncol = 2 )
# Simulate each observation depending on the component its been allocated
for ( i in 1:N ) {
    if ( z[i] == 1 ) {
        X[i,] = mvrnorm( 1, theta1, diag(2) )
    } else {
        X[i,] = mvrnorm( 1, theta2, diag(2) )
    }
}
dataset = list("X" = X)

## ------------------------------------------------------------------------
params = list( "theta1" = c( 0, 0 ), "theta2" = c( 0.1, 0.1 ) )

## ------------------------------------------------------------------------
logLik = function( params, dataset ) {
    # Declare Sigma (assumed known)
    SigmaDiag = c(1, 1)
    # Declare distribution of each component
    component1 = tf$distributions$MultivariateNormalDiag( params$theta1, SigmaDiag )
    component2 = tf$distributions$MultivariateNormalDiag( params$theta2, SigmaDiag )
    # Declare allocation probabilities of each component
    probs = tf$distributions$Categorical(c(0.5,0.5))
    # Declare full mixture distribution given components and allocation probabilities
    distn = tf$distributions$Mixture(probs, list(component1, component2))
    # Declare log likelihood
    logLik = tf$reduce_sum( distn$log_prob(dataset$X) )
    return( logLik )
}

## ------------------------------------------------------------------------
logPrior = function( params ) {
    # Declare hyperparameters mu0 and Sigma0
    mu0 = c( 0, 0 )
    Sigma0Diag = c(10, 10)
    # Declare prior distribution
    priorDistn = tf$distributions$MultivariateNormalDiag( mu0, Sigma0Diag )
    # Declare log prior density and return
    logPrior = priorDistn$log_prob( params$theta1 ) + priorDistn$log_prob( params$theta2 )
    return( logPrior )
}

## ------------------------------------------------------------------------
stepsize = list( "theta1" = 2e-5, "theta2" = 2e-5 )

## ----eval=FALSE----------------------------------------------------------
#  chains = sghmc( logLik, dataset, params, stepsize, logPrior = logPrior, nIters = 11000,
#          verbose = FALSE, seed = 13 )

## ----echo=FALSE----------------------------------------------------------
tryCatch({
    chains = sghmc( logLik, dataset, params, stepsize, logPrior = logPrior, nIters = 11000, 
            verbose = FALSE, seed = 13 )
}, error = function (e) { 
    writeLines("Not all tensorflow dependencies are met so skipping this...")
    writeLines("Try running tensorflow::install_tensorflow().")
})

## ----eval=FALSE----------------------------------------------------------
#  library(ggplot2)
#  # Remove burn in
#  burnIn = 10^3
#  chains = list( "theta1" = as.data.frame( chains$theta1[-c(1:burnIn),] ),
#                 "theta2" = as.data.frame( chains$theta2[-c(1:burnIn),] ) )
#  # Concatenate the two chains for the plot to get a picture of the whole distribution
#  plotData = rbind(chains$theta1, chains$theta2)
#  ggplot( plotData, aes( x = V1, y = V2 ) ) +
#      stat_density2d( size = 1.5, alpha = 0.7 )

## ----echo=FALSE----------------------------------------------------------
tryCatch({
    a = tf$constant(c(1, 1))
    library(ggplot2)
    # Remove burn in
    burnIn = 10^3
    chains = list( "theta1" = as.data.frame( chains$theta1[-c(1:burnIn),] ),
            "theta2" = as.data.frame( chains$theta2[-c(1:burnIn),] ) )
    # Concatenate the two chains for the plot to get a picture of the whole distribution
    plotData = rbind(chains$theta1, chains$theta2)
    ggplot( plotData, aes( x = V1, y = V2 ) ) +
            stat_density2d( size = 1.5, alpha = 0.7 )
}, error = function (e) { 
    writeLines("Not all tensorflow dependencies are met so skipping this...")
    writeLines("Try running tensorflow::install_tensorflow().")
})

