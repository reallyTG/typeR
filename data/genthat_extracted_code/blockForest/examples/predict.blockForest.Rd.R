library(blockForest)


### Name: predict.blockForest
### Title: Prediction using Random Forest variants for block-structured
###   covariate data
### Aliases: predict.blockForest

### ** Examples

# NOTE: There is no association between covariates and response for the
# simulated data below.
# Moreover, the input parameters of blockfor() are highly unrealistic
# (e.g., nsets = 10 is specified much too small).
# The purpose of the shown examples is merely to illustrate the
# application of predict.blockForest().


# Generate data:
################

set.seed(1234)

# Covariate matrix:
X <- cbind(matrix(nrow=40, ncol=5, data=rnorm(40*5)), 
           matrix(nrow=40, ncol=30, data=rnorm(40*30, mean=1, sd=2)),
           matrix(nrow=40, ncol=100, data=rnorm(40*100, mean=2, sd=3)))
colnames(X) <- paste("X", 1:ncol(X), sep="")

# Block variable (list):
block <- rep(1:3, times=c(5, 30, 100))
block <- lapply(1:3, function(x) which(block==x))

# Binary outcome:
ybin <- factor(sample(c(0,1), size=40, replace=TRUE), levels=c(0,1))

# Survival outcome:
ysurv <- cbind(rnorm(40), sample(c(0,1), size=40, replace=TRUE))



# Divide in training and test data:

Xtrain <- X[1:30,]
Xtest <- X[31:40,]

ybintrain <- ybin[1:30]
ybintest <- ybin[31:40]

ysurvtrain <- ysurv[1:30,]
ysurvtest <- ysurv[31:40,]




# Binary outcome: Apply algorithm to training data and obtain predictions
# for the test data:
#########################################################################

# Apply a variant to the training data:

blockforobj <- blockfor(Xtrain, ybintrain, num.trees = 100, replace = TRUE, block=block,
                        nsets = 10, num.trees.pre = 50, splitrule="extratrees", 
                        block.method = "SplitWeights")
blockforobj$paramvalues


# Obtain prediction for the test data:

(predres <- predict(blockforobj$forest, data = Xtest, block.method = "SplitWeights"))
predres$predictions



# Survival outcome: Apply algorithm to training data and obtain predictions
# for the test data:
###########################################################################

# Apply a variant to the training data:

blockforobj <- blockfor(Xtrain, ysurvtrain, num.trees = 100, replace = TRUE, block=block,
                        nsets = 10, num.trees.pre = 50, splitrule="extratrees", 
                        block.method = "SplitWeights")
blockforobj$paramvalues


# Obtain prediction for the test data:

(predres <- predict(blockforobj$forest, data = Xtest, block.method = "SplitWeights"))
rowSums(predres$chf)




