## ----eval=FALSE----------------------------------------------------------
#  dataset = list("X" = X, "Y" = Y)

## ----eval=FALSE----------------------------------------------------------
#  params = list("theta1" = rep(0, 3), "theta2" = rep(0, 3))

## ----eval=FALSE----------------------------------------------------------
#  library(MASS)
#  # Simulate and declare dataset
#  dataset = list("X" = mvrnorm(10^4, c(0, 0), diag(2)))
#  # Simulate random starting point
#  params = list("theta" = rnorm(2))
#  
#  # Declare log likelihood
#  logLik = function(params, dataset) {
#      # Declare distribution, assuming Sigma known and constant
#      SigmaDiag = c( 1, 1 )
#      distn = tf$distributions$MultivariateNormalDiag(params$theta, SigmaDiag)
#      # Return sum of log pdf
#      return(tf$reduce_sum(distn$log_prob(dataset$X)))
#  }
#  
#  # Declare log prior
#  logPrior = function(params) {
#      # Declare prior distribution
#      distn = tf$distributions$StudentT(3, 0, 1)
#      # Apply log prior componentwise and return sum
#      return(tf$reduce_sum(distn$log_prob(params$theta)))
#  }

## ----eval=FALSE----------------------------------------------------------
#  stepsize = list( "theta = 1e-5" )

## ----eval=FALSE----------------------------------------------------------
#  sgld( logLik, dataset, params, stepsize )

## ----eval=FALSE----------------------------------------------------------
#  sgld( logLik, dataset, params, stepsize, logPrior = logPrior, minibatchSize = 500 )

## ----eval=FALSE----------------------------------------------------------
#  optStepsize = 0.1
#  sgldcv( logLik, dataset, params, stepsize, optStepsize, logPrior = logPrior, minibatchSize = 500 )

