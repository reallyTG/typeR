library(ordinalNet)


### Name: ordinalNetCV
### Title: Uses K-fold cross validation to obtain out-of-sample
###   log-likelihood and misclassification rates. Lambda is tuned within
###   each cross validation fold.
### Aliases: ordinalNetCV

### ** Examples

## Not run: 
##D # Simulate x as independent standard normal
##D # Simulate y|x from a parallel cumulative logit (proportional odds) model
##D set.seed(1)
##D n <- 50
##D intercepts <- c(-1, 1)
##D beta <- c(1, 1, 0, 0, 0)
##D ncat <- length(intercepts) + 1  # number of response categories
##D p <- length(beta)  # number of covariates
##D x <- matrix(rnorm(n*p), ncol=p)  # n x p covariate matrix
##D eta <- c(x %*% beta) + matrix(intercepts, nrow=n, ncol=ncat-1, byrow=TRUE)
##D invlogit <- function(x) 1 / (1+exp(-x))
##D cumprob <- t(apply(eta, 1, invlogit))
##D prob <- cbind(cumprob, 1) - cbind(0, cumprob)
##D yint <- apply(prob, 1, function(p) sample(1:ncat, size=1, prob=p))
##D y <- as.factor(yint)
##D 
##D # Evaluate out-of-sample performance of the  cumulative logit model
##D # when lambda is tuned by cross validation (best average out-of-sample log-likelihood)
##D cv <- ordinalNetCV(x, y, tuneMethod="cvLoglik")
##D summary(cv)
## End(Not run)




