library(varbvs)


### Name: varbvsmix
### Title: Fit linear regression with mixture-of-normals priors using
###   variational approximation methods.
### Aliases: varbvsmix

### ** Examples


# Generate the data set.
set.seed(1)
n    <- 200
p    <- 500
X    <- randn(n,p)
sd   <- c(0,0.2,0.5)
w    <- c(0.9,0.05,0.05)
k    <- sample(length(w),p,replace = TRUE,prob = w)
beta <- sd[k] * rnorm(p)
y    <- c(X %*% beta + rnorm(n))

# Fit the model to the data.
fit <- varbvsmix(X,NULL,y,sd^2)

## Not run: 
##D library(lattice)
##D print(xyplot(beta.est ~ beta.true,
##D              data.frame(beta.true = beta,
##D                         beta.fitted = rowSums(fit$alpha * fit$mu)),
##D              pch = 20,col = "royalblue",cex = 1))
## End(Not run)



