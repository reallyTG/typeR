library(blockForest)


### Name: blockfor
### Title: Random Forest variants for block-structured covariate data
### Aliases: blockfor

### ** Examples

# NOTE: There is no association between covariates and response for the
# simulated data below.
# Moreover, the input parameters of blockfor() are highly unrealistic
# (e.g., nsets = 10 is specified much too small).
# The purpose of the shown examples is merely to illustrate the
# application of blockfor().


# Generate data:
################

set.seed(1234)

# Covariate matrix:
X <- cbind(matrix(nrow=40, ncol=5, data=rnorm(40*5)), 
           matrix(nrow=40, ncol=30, data=rnorm(40*30, mean=1, sd=2)),
           matrix(nrow=40, ncol=100, data=rnorm(40*100, mean=2, sd=3)))

# Block variable (list):
blocks <- rep(1:3, times=c(5, 30, 100))
blocks <- lapply(1:3, function(x) which(blocks==x))

# Binary outcome:
ybin <- factor(sample(c(0,1), size=40, replace=TRUE), levels=c(0,1))

# Survival outcome:
ysurv <- cbind(rnorm(40), sample(c(0,1), size=40, replace=TRUE))

# Application to binary outcome:
################################

blockforobj <- blockfor(X, ybin, num.trees = 100, replace = TRUE, blocks=blocks,
                        nsets = 10, num.trees.pre = 50, splitrule="extratrees", 
                        block.method = "BlockForest")
# Tuning parameter estimates (see Hornung & Wright (2018)):
blockforobj$paramvalues

# Application to survival outcome:
##################################

blockforobj <- blockfor(X, ysurv, num.trees = 100, replace = TRUE, blocks=blocks,
                        nsets = 10, num.trees.pre = 50, splitrule="extratrees", 
                        block.method = "BlockForest")
blockforobj$paramvalues




