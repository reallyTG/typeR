library(NormalBetaPrime)


### Name: nbp
### Title: Normal-Beta Prime Regression
### Aliases: nbp

### ** Examples


###############################
## Example on diabetes data. ## 
###############################
data(diabetes)
attach(diabetes)
X <- scale(diabetes$x) # Center and scale X
y <- scale(diabetes$y) # Center and scale y

################################
# Fit the NBP regression model #
################################
# Should use default of 20,000 for max.steps and 10,000 for burnin
nbp.model <- nbp(X=X, y=y, method.hyperparameters="mml", 
                max.steps=5000, burnin=2500, selection="dss")

nbp.model$beta.med     # posterior median estimates
nbp.model$a.estimate   # MML estimate of shape parameter 'a'
nbp.model$b.estimate   # MML estimate of shape parameter 'b'

nbp.model$beta.intervals         # 95 percent posterior credible intervals
nbp.model$nbp.classifications    # Variables selected

## No test: 
#
#
######################################################
######################################################
## TRIM32 gene expression data analysis.            ##
## Running this code will allow you to reproduce    ##
## the results in Section 6 of Bai and Ghosh (2018) ##
######################################################
######################################################

# Load the data
data(eyedata)

# Set seed
set.seed(123)

# Center design matrix X and response vector y
X <- scale(genes, center=TRUE, scale=TRUE) # gene expression data (covariates)
y <- scale(trim32, center=TRUE, scale=TRUE) # levels of TRIM32 (response)
  
###########################
# Implement the NBP model #
###########################
nbp.model = nbp(X,y, method.hyperparameters="mml", selection="dss")

# Variables selected
active.indices <- which(nbp.model$nbp.classifications != 0) # active genes
active.estimates <- nbp.model$beta.med[active.indices]
active.CIs <- nbp.model$beta.intervals[, active.indices]


###################################
# Evaluate predictive performance #
###################################
k <- 5  # Number of folds

# Randomly select indices for the 5 different folds 
folds <- split(sample(nrow(X), nrow(X), replace=FALSE), as.factor(1:k)) 
# To store the mean square prediction error
mspe.nbp <- rep(NA, k)

for(i in 1:k){
  
  # Split data into training set and test set based on folds
  test_ind = folds[[i]]
  
  # 80 percent training set
  y.train = y[-test_ind]
  X.train = X[-test_ind, ]
  
  # Rest is test set 
  y.test = y[test_ind] 
  X.test = X[test_ind, ]
  
  # Run MBSP model on training set
   nbp.train = nbp(X=X.train, y=y.train, method.hyperparameters="mml", selection="dss")
   beta.train <- nbp.train$beta.med
   
  # Obtain predictions on test set
  nbp.pred = crossprod(t(X.test), beta.train)
  
  # Compute the MSPE on test set
  mspe.nbp[i] = mean((nbp.pred - y.test)^2)
}

mean.nbp.mspe <- mean(mspe.nbp)
mean.nbp.mspe
## End(No test)




