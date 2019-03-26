library(fuzzyforest)


### Name: ff.formula
### Title: Fuzzy forests algorithm
### Aliases: ff.formula

### ** Examples

#ff requires that the partition of the covariates be previously determined.
#ff is also handy if the user wants to test out multiple settings of WGCNA
#prior to running fuzzy forests.
library(mvtnorm)
gen_mod <- function(n, p, corr) {
  sigma <- matrix(corr, nrow=p, ncol=p)
  diag(sigma) <- 1
  X <- rmvnorm(n, sigma=sigma)
  return(X)
}

gen_X <- function(n, mod_sizes, corr){
  m <- length(mod_sizes)
  X_list <- vector("list", length = m)
  for(i in 1:m){
    X_list[[i]] <- gen_mod(n, mod_sizes[i], corr[i])
  }
  X <- do.call("cbind", X_list)
  return(X)
}

err_sd <- .5
n <- 500
mod_sizes <- rep(25, 4)
corr <- rep(.8, 4)
X <- gen_X(n, mod_sizes, corr)
beta <- rep(0, 100)
beta[c(1:4, 76:79)] <- 5
y <- X%*%beta + rnorm(n, sd=err_sd)
X <- as.data.frame(X)
dat <- as.data.frame(cbind(y, X))

Xtest <- gen_X(n, mod_sizes, corr)
ytest <- Xtest%*%beta + rnorm(n, sd=err_sd)
Xtest <- as.data.frame(Xtest)

cdist <- as.dist(1 - cor(X))
hclust_fit <- hclust(cdist, method="ward.D")
groups <- cutree(hclust_fit, k=4)

screen_c <- screen_control(keep_fraction = .25,
                           ntree_factor = 1,
                           min_ntree = 250)
select_c <- select_control(number_selected = 10,
                           ntree_factor = 1,
                           min_ntree = 250)
## No test: 
ff_fit <- ff(y ~ ., data=dat,
             module_membership = groups,
             screen_params = screen_c,
             select_params = select_c,
             final_ntree = 250)
#extract variable importance rankings
vims <- ff_fit$feature_list

#plot results
modplot(ff_fit)

#obtain predicted values for a new test set
preds <- predict(ff_fit, new_data=Xtest)

#estimate test set error
test_err <- sqrt(sum((ytest - preds)^2)/n)
## End(No test)



