library(MixfMRI)


### Name: Covariance Matrices
### Title: Covariance Matrices
### Aliases: post.prob cov.param cov.post.z cov.logit.z
### Keywords: programming

### ** Examples

library(MixfMRI, quietly = TRUE)
library(EMCluster, quietly = TRUE)
.FC.CT$model.X <- "I"
.FC.CT$CONTROL$debug <- 0
K <- 3
  
## No test: 
  ### Fit toy1.
  set.seed(1234)
  X.gbd <- toy1$X.gbd
  X.range <- apply(X.gbd, 2, range)
  X.gbd <- t((t(X.gbd) - X.range[1,]) / (X.range[2,] - X.range[1,]))
  PV.gbd <- toy1$PV.gbd
  fcobj <- fclust(X.gbd, PV.gbd, K = K, min.1st.prop = 0.5)
  
  ### Test cov matrix of posterior z and logit posterior z.
  x <- list(X.gbd = X.gbd, PV.gbd = PV.gbd)
  post.z <- post.prob(x, fcobj)
  cov.param <- cov.param(x, fcobj, post.z = post.z)
  cov.post.z <- cov.post.z(x, fcobj, post.z = post.z,
                               cov.param = cov.param$cov)
  cov.logit.z <- cov.logit.z(x, fcobj, post.z = post.z,
                                 cov.param = cov.param$cov,
                                 cov.post.z = cov.post.z)
  
  ### Compute cov matrix of log odds ratio for all k > 1.
  A <- cbind(rep(-1, K - 1), diag(1, K - 1))
  logit.p <- log(post.z[fcobj$class != 1,] / (1 - post.z[fcobj$class != 1,]))
  log.or <- logit.p %*% t(A)
  cov.log.or <- lapply(cov.logit.z, function(x) A %*% x %*% t(A))
  
  ### Check if 0 vector covered by 95% confidence ellipsoid.
  id <- 1
  plot(log.or[id,],
       xlim = log.or[id, 1] + c(-5, 5),
       ylim = log.or[id, 2] + c(-5, 5),
       main = "1st observation", xlab = "x", ylab = "y")
  plotBN(log.or[id,], cov.log.or[[id]])
  points(0, 0, col = 2)
## End(No test)



