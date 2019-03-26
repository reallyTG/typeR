## ----eval=FALSE----------------------------------------------------------
#  library(bayesImageS)
#  library(doParallel)
#  set.seed(123)
#  q <- 2
#  beta <- c(0.22, 0.44, 0.88, 1.32)
#  mask <- matrix(1,nrow=500,ncol=500)
#  n <- prod(dim(mask))
#  neigh <- getNeighbors(mask, c(2,2,0,0))
#  block <- getBlocks(mask, 2)
#  edges <- getEdges(mask, c(2,2,0,0))
#  maxS <- nrow(edges)
#  
#  cl <- makeCluster(min(4, detectCores()))
#  registerDoParallel(cl)
#  
#  tm <- system.time(synth <- foreach (i=1:length(beta),
#                        .packages="bayesImageS") %dopar% {
#    gen <- list()
#    gen$beta <- beta[i]
#    # generate labels
#    sw <- swNoData(beta[i], q, neigh, block, 200)
#    gen$z <- sw$z
#    gen$sum <- sw$sum[200]
#    # now add noise
#    gen$mu <- rnorm(2, c(-1,1), 0.5)
#    gen$sd <- 1/sqrt(rgamma(2, 1.5, 2))
#    gen$y <- rnorm(n, gen$mu[(gen$z[1:n,1])+1],
#                      gen$sd[(gen$z[1:n,1])+1])
#    gen
#  })
#  stopCluster(cl)

## ----echo=FALSE----------------------------------------------------------
library(bayesImageS)
data("synth", package = "bayesImageS")
print(synth$tm)

## ----eval=FALSE----------------------------------------------------------
#  priors <- list()
#  priors$k <- q
#  priors$mu <- c(-1,1)
#  priors$mu.sd <- rep(0.5,q)
#  priors$sigma <- rep(2,q)
#  priors$sigma.nu <- rep(1.5,q)
#  priors$beta <- rep(synth[[1]]$beta, 2)
#  
#  mh <- list(algorithm="ex", bandwidth=1, adaptive=NA,
#             auxiliary=1)
#  tm <- system.time(res <- mcmcPotts(synth[[1]]$y, neigh,
#                              block, priors, mh, 100, 50))

## ------------------------------------------------------------------------
data("res", package = "bayesImageS")
print(res$tm)
mean(res$sum[51:100])
print(synth[[1]]$sum)
ts.plot(res$sum, xlab="MCMC iterations", ylab=expression(S(z)))
abline(h=synth[[1]]$sum, col=4, lty=2)

## ----eval=FALSE----------------------------------------------------------
#  priors$beta <- rep(synth[[2]]$beta, 2)
#  tm2 <- system.time(res2 <- mcmcPotts(synth[[2]]$y,
#                        neigh, block, priors, mh, 100, 50))

## ----echo=FALSE----------------------------------------------------------
data("res2", package = "bayesImageS")
print(res2$tm)
ts.plot(res2$sum, xlab="MCMC iterations", ylab=expression(S(z)))
abline(h=synth[[2]]$sum, col=4, lty=2)

## ----eval=FALSE----------------------------------------------------------
#  priors$beta <- rep(synth[[3]]$beta, 2)
#  tm3 <- system.time(res3 <- mcmcPotts(synth[[3]]$y,
#                        neigh, block, priors, mh, 100, 50))

## ----echo=FALSE----------------------------------------------------------
data("res3", package = "bayesImageS")
print(res3$tm)
ts.plot(res3$sum, xlab="MCMC iterations", ylab=expression(S(z)))
abline(h=synth[[3]]$sum, col=4, lty=2)

## ----eval=FALSE----------------------------------------------------------
#  priors$beta <- rep(synth[[4]]$beta, 2)
#  tm4 <- system.time(res4 <- mcmcPotts(synth[[4]]$y,
#                      neigh, block, priors, mh, 100, 50))

## ----echo=FALSE----------------------------------------------------------
data("res4", package = "bayesImageS")
print(res4$tm)
ts.plot(res4$sum, xlab="MCMC iterations", ylab=expression(S(z)))
abline(h=synth[[4]]$sum, col=4, lty=2)

## ----eval=FALSE----------------------------------------------------------
#  tm5 <- system.time(res5 <- mcmcPottsNoData(synth[[4]]$beta, q,
#                                      neigh, block, 5000))

## ----echo=FALSE----------------------------------------------------------
data("res5", package = "bayesImageS")
print(res5$tm)
ts.plot(res5$sum, xlab="MCMC iterations", ylab=expression(S(z)))
abline(h=synth[[4]]$sum, col=4, lty=2)

