## ----message=FALSE-------------------------------------------------------
library(sgmcmc)
# Download and load covertype dataset
covertype = getDataset("covertype")

## ------------------------------------------------------------------------
set.seed(13)
testObservations = sample(nrow(covertype), 10^4)
testSet = covertype[testObservations,]
X = covertype[-c(testObservations),2:ncol(covertype)]
y = covertype[-c(testObservations),1]
dataset = list( "X" = X, "y" = y )

## ------------------------------------------------------------------------
# Get the dimension of X, needed to set shape of params$beta
d = ncol(dataset$X)
params = list( "bias" = 0, "beta" = matrix( rep( 0, d ), nrow = d ) )

## ------------------------------------------------------------------------
logLik = function(params, dataset) {
    yEstimated = 1 / (1 + tf$exp( - tf$squeeze(params$bias + tf$matmul(dataset$X, params$beta))))
    logLik = tf$reduce_sum(dataset$y * tf$log(yEstimated) + (1 - dataset$y) * tf$log(1 - yEstimated))
    return(logLik)
}

## ------------------------------------------------------------------------
logPrior = function(params) {
    logPrior = - (tf$reduce_sum(tf$abs(params$beta)) + tf$reduce_sum(tf$abs(params$bias)))
    return(logPrior)
}

## ------------------------------------------------------------------------
stepsizesMCMC = list("beta" = 5e-6, "bias" = 5e-6)
stepsizesOptimization = 5e-6

## ---- eval = FALSE-------------------------------------------------------
#  output = sgldcv(logLik, dataset, params, stepsizesMCMC, stepsizesOptimization, logPrior = logPrior,
#          minibatchSize = 500, nIters = 11000, verbose = FALSE, seed = 13 )

## ----echo=FALSE----------------------------------------------------------
tryCatch({
output = sgldcv(logLik, dataset, params, stepsizesMCMC, stepsizesOptimization, logPrior = logPrior, 
        minibatchSize = 500, nIters = 11000, verbose = FALSE, seed = 13 ) 
}, error = function (e) { 
    writeLines("Not all tensorflow dependencies are met so skipping this...")
    writeLines("Try running tensorflow::install_tensorflow().")
})

## ----eval=FALSE----------------------------------------------------------
#  yTest = testSet[,1]
#  XTest = testSet[,2:ncol(testSet)]
#  # Remove burn-in
#  output$bias = output$bias[-c(1:1000)]
#  output$beta = output$beta[-c(1:1000),,]
#  iterations = seq(from = 1, to = 10^4, by = 10)
#  logLoss = rep(0, length(iterations))
#  # Calculate log loss every 10 iterations
#  for ( iter in 1:length(iterations) ) {
#      j = iterations[iter]
#      # Get parameters at iteration j
#      beta0_j = output$bias[j]
#      beta_j = output$beta[j,]
#      for ( i in 1:length(yTest) ) {
#          pihat_ij = 1 / (1 + exp(- beta0_j - sum(XTest[i,] * beta_j)))
#          y_i = yTest[i]
#          # Calculate log loss at current test set point
#          LogPred_curr = - (y_i * log(pihat_ij) + (1 - y_i) * log(1 - pihat_ij))
#          logLoss[iter] = logLoss[iter] + 1 / length(yTest) * LogPred_curr
#      }
#  }
#  library(ggplot2)
#  plotFrame = data.frame("iteration" = iterations, "logLoss" = logLoss)
#  ggplot(plotFrame, aes(x = iteration, y = logLoss)) +
#      geom_line() +
#      ylab("Log loss of test set")

## ----echo=FALSE----------------------------------------------------------
tryCatch({
    a = tf$constant(c(1, 1))
    yTest = testSet[,1]
    XTest = testSet[,2:ncol(testSet)]
    # Remove burn-in
    output$bias = output$bias[-c(1:1000)]
    output$beta = output$beta[-c(1:1000),,]
    iterations = seq(from = 1, to = 10^4, by = 10)
    logLoss = rep(0, length(iterations))
    # Calculate log loss every 10 iterations
    for ( iter in 1:length(iterations) ) {
        j = iterations[iter]
        # Get parameters at iteration j
        beta0_j = output$bias[j]
        beta_j = output$beta[j,]
        for ( i in 1:length(yTest) ) {
            pihat_ij = 1 / (1 + exp(- beta0_j - sum(XTest[i,] * beta_j)))
            y_i = yTest[i]
            # Calculate log loss at current test set point
            LogPred_curr = - (y_i * log(pihat_ij) + (1 - y_i) * log(1 - pihat_ij))
            logLoss[iter] = logLoss[iter] + 1 / length(yTest) * LogPred_curr
        }
    }
    library(ggplot2)
    plotFrame = data.frame("iteration" = iterations, "logLoss" = logLoss)
    ggplot(plotFrame, aes(x = iteration, y = logLoss)) +
        geom_line() +
        ylab("Log loss of test set")
}, error = function (e) { 
    writeLines("Not all tensorflow dependencies are met so skipping this...")
    writeLines("Try running tensorflow::install_tensorflow().")
})

