library(Rborist)


### Name: Rborist
### Title: Rapid Decision Tree Construction and Evaluation
### Aliases: Rborist Rborist.default

### ** Examples

## Not run: 
##D   # Regression example:
##D   nRow <- 5000
##D   x <- data.frame(replicate(6, rnorm(nRow)))
##D   y <- with(x, X1^2 + sin(X2) + X3 * X4) # courtesy of S. Welling.
##D 
##D   # Classification example:
##D   data(iris)
##D 
##D   # Generic invocation:
##D   rb <- Rborist(x, y)
##D 
##D 
##D   # Causes 300 trees to be trained:
##D   rb <- Rborist(x, y, nTree = 300)
##D 
##D 
##D   # Causes rows to be sampled without replacement:
##D   rb <- Rborist(x, y, withRepl=FALSE)
##D 
##D 
##D   # Causes validation census to report class probabilities:
##D   rb <- Rborist(iris[-5], iris[5], ctgCensus="prob")
##D 
##D 
##D   # Applies table-weighting to classification categories:
##D   rb <- Rborist(iris[-5], iris[5], classWeight = "balance")
##D 
##D 
##D   # Weights first category twice as heavily as remaining two:
##D   rb <- Rborist(iris[-5], iris[5], classWeight = c(2.0, 1.0, 1.0))
##D 
##D 
##D   # Does not split nodes when doing so yields less than a 2% gain in
##D   # information over the parent node:
##D   rb <- Rborist(x, y, minInfo=0.02)
##D 
##D 
##D   # Does not split nodes representing fewer than 10 unique samples:
##D   rb <- Rborist(x, y, minNode=10)
##D 
##D 
##D   # Trains a maximum of 20 levels:
##D   rb <- Rborist(x, y, nLevel = 20)
##D 
##D 
##D   # Trains, but does not perform subsequent validation:
##D   rb <- Rborist(x, y, noValidate=TRUE)
##D 
##D 
##D   # Chooses 500 rows (with replacement) to root each tree.
##D   rb <- Rborist(x, y, nSamp=500)
##D 
##D 
##D   # Chooses 2 predictors as splitting candidates at each node (or
##D   # fewer, when choices exhausted):
##D   rb <- Rborist(x, y, predFixed = 2)  
##D 
##D 
##D   # Causes each predictor to be selected as a splitting candidate with
##D   # distribution Bernoulli(0.3):
##D   rb <- Rborist(x, y, predProb = 0.3) 
##D 
##D 
##D   # Causes first three predictors to be selected as splitting candidates
##D   # twice as often as the other two:
##D   rb <- Rborist(x, y, predWeight=c(2.0, 2.0, 2.0, 1.0, 1.0))
##D 
##D 
##D   # Causes (default) quantiles to be computed at validation:
##D   rb <- Rborist(x, y, quantiles=TRUE)
##D   qPred <- rb$validation$qPred
##D 
##D 
##D   # Causes specfied quantiles (deciles) to be computed at validation:
##D   rb <- Rborist(x, y, quantVec = seq(0.1, 1.0, by = 0.10))
##D   qPred <- rb$validation$qPred
##D 
##D 
##D   # Causes (default) quantile computation to be approximated by a
##D   # small bin size of 100:  fast, but not as accurate:
##D   rb <- Rborist(x, y, quantiles = TRUE, qBin = 100).
##D   qPred <- rb$validation$qPred
##D 
##D 
##D   # Constrains modelled response to be increasing with respect to X1
##D   # and decreasing with respect to X5.
##D   rb <- Rborist(x, y, regMono=c(1.0, 0, 0, 0, -1.0, 0))
##D 
##D 
##D   # Causes rows to be sampled with random weighting:
##D   rb <- Rborist(x, y, rowWeight=runif(nRow))
##D 
##D 
##D   # Suppresses creation of detailed leaf information needed for
##D   # quantile prediction and external tools.
##D   rb <- Rborist(x, y, thinLeaves = TRUE)
##D 
##D 
##D   # Sets splitting position for predictor 0 to far left and predictor
##D   # 1 to far right, others to default (median) position.
##D 
##D   spq <- rep(0.5, ncol(x))
##D   spq[0] <- 0.0
##D   spq[1] <- 1.0
##D   rb <- Rborist(x, y, splitQuant = spq)
##D   
## End(Not run)



