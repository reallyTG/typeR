## ----eval=FALSE----------------------------------------------------------
#  library(sgmcmc)
#  # Download and load MNIST dataset
#  mnist = getDataset("mnist")
#  # Build dataset list and testset list
#  dataset = list("X" = mnist$train$images, "y" = mnist$train$labels)
#  testset = list("X" = mnist$test$images, "y" = mnist$test$labels)

## ----eval=FALSE----------------------------------------------------------
#  # Sample initial weights from standard Normal
#  d = ncol(dataset$X) # dimension of chain
#  params = list()
#  params$A = matrix( rnorm(10*100), ncol = 10 )
#  params$B = matrix(rnorm(d*100), ncol = 100)
#  # Sample initial bias parameters from standard Normal
#  params$a = rnorm(10)
#  params$b = rnorm(100)
#  # Sample initial precision parameters from standard Gamma
#  params$lambdaA = rgamma(1, 1)
#  params$lambdaB = rgamma(1, 1)
#  params$lambdaa = rgamma(1, 1)
#  params$lambdab = rgamma(1, 1)

## ------------------------------------------------------------------------
logLik = function(params, dataset) {
    # Calculate estimated probabilities
    beta = tf$nn$softmax(tf$matmul(dataset$X, params$B) + params$b)
    beta = tf$nn$softmax(tf$matmul(beta, params$A) + params$a)
    # Calculate log likelihood of categorical distn with probabilities beta
    logLik = tf$reduce_sum(dataset$y * tf$log(beta))
    return(logLik)
}

logPrior = function(params) {
    distLambda = tf$distributions$Gamma(1, 1)
    distA = tf$distributions$Normal(0, tf$rsqrt(params$lambdaA))
    logPriorA = tf$reduce_sum(distA$log_prob(params$A)) + distLambda$log_prob(params$lambdaA)
    distB = tf$distributions$Normal(0, tf$rsqrt(params$lambdaB))
    logPriorB = tf$reduce_sum(distB$log_prob(params$B)) + distLambda$log_prob(params$lambdaB)
    dista = tf$distributions$Normal(0, tf$rsqrt(params$lambdaa))
    logPriora = tf$reduce_sum(dista$log_prob(params$a)) + distLambda$log_prob(params$lambdaa)
    distb = tf$distributions$Normal(0, tf$rsqrt(params$lambdab))
    logPriorb = tf$reduce_sum(distb$log_prob(params$b)) + distLambda$log_prob(params$lambdab)
    logPrior = logPriorA + logPriorB + logPriora + logPriorb
    return(logPrior)
}

## ----eval=FALSE----------------------------------------------------------
#  stepsize = 1e-4
#  sgld = sgldSetup(logLik, dataset, params, stepsize, logPrior = logPrior,
#          minibatchSize = 500, seed = 13)

## ----eval=FALSE----------------------------------------------------------
#  sess = initSess(sgld)

## ----eval=FALSE----------------------------------------------------------
#  for (i in 1:10^3L) {
#      sgmcmcStep(sgld, sess)
#      currentState = getParams(sgld, sess)
#  }

## ----eval=FALSE----------------------------------------------------------
#  testPlaceholder = list()
#  testPlaceholder[["X"]] = tf$placeholder(tf$float32, dim(testset[["X"]]))
#  testPlaceholder[["y"]] = tf$placeholder(tf$float32, dim(testset[["y"]]))

## ----eval=FALSE----------------------------------------------------------
#  # Get number of observations in test set, ensuring it's a double (R equivalent of float)
#  Ntest = as.double(nrow(testset[["X"]]))
#  logLoss = - logLik(sgld$params, testPlaceholder) / Ntest

## ----eval=FALSE----------------------------------------------------------
#  sess = initSess(sgld)
#  # Fill a feed dict with full test set (used to calculate log loss)
#  feedDict = dict()
#  feedDict[[testPlaceholder[["X"]]]] = testset[["X"]]
#  feedDict[[testPlaceholder[["y"]]]] = testset[["y"]]
#  # Burn-in chain
#  message("Burning-in chain...")
#  message("iteration\tlog loss")
#  for (i in 1:10^3) {
#      # Print progress
#      if (i %% 100 == 0) {
#          progress = sess$run(logLoss, feed_dict = feedDict)
#          message(paste0(i, "\t", progress))
#      }
#      sgmcmcStep(sgld, sess)
#  }
#  # Initialise Monte Carlo estimate using value after burn-in
#  avParams = getParams(sgld, sess)
#  # Run chain
#  message("Running SGMCMC...")
#  for (i in 1:10^4) {
#      sgmcmcStep(sgld, sess)
#      # Update av Params
#      currentState = getParams(sgld, sess)
#      for (paramName in names(avParams)) {
#          avParams[[paramName]] = (avParams[[paramName]] * i + currentState[[paramName]]) / (i + 1)
#      }
#      # Print progress
#      if (i %% 100 == 0) {
#          progress = sess$run(logLoss, feed_dict = feedDict)
#          message(paste0(i, "\t", progress))
#      }
#  }

## ----echo=FALSE----------------------------------------------------------
# Check a stripped down version of the vignette runs if TensorFlow built properly, otherwise skip.
checkRuns = function( logLik, logPrior ) {
    suppressMessages(library(sgmcmc))
    mnist = getDataset("mnist")
    dataset = list("X" = mnist$train$images, "y" = mnist$train$labels)
    testset = list("X" = mnist$test$images, "y" = mnist$test$labels)
    d = ncol(dataset$X) # dimension of chain
    params = list()
    params$A = matrix( rnorm(10*100), ncol = 10 )
    params$B = matrix(rnorm(d*100), ncol = 100)
    params$a = rnorm(10)
    params$b = rnorm(100)
    params$lambdaA = rgamma(1, 1)
    params$lambdaB = rgamma(1, 1)
    params$lambdaa = rgamma(1, 1)
    params$lambdab = rgamma(1, 1)
    stepsize = 1e-4
    sgld = sgldSetup(logLik, dataset, params, stepsize, logPrior = logPrior, minibatchSize = 500)
    sess = initSess(sgld)
    for (i in 1:100) {
        sgmcmcStep(sgld, sess)
        currentState = getParams(sgld, sess)
    }
}

# Use try catch in case TensorFlow not build properly
tryCatch({
    checkRuns(logLik, logPrior)
}, error = function (e) {
    print(e)
#    writeLines("Not all tensorflow dependencies are met so skipping this...")
#    writeLines("Try running tensorflow::install_tensorflow().")
})

