## ---- eval=TRUE, echo=FALSE----------------------------------------------
library(pulsar)

## ---- eval=TRUE----------------------------------------------------------
  p <- 40
  n <- round(8*p * log(p))
  library(huge)
  set.seed(10010)
  dat <- huge.generator(n, p, 'hub', verbose=FALSE, v=.3, u=.1)

  ## Generate correlated binomial data with the Normal copula method
  X  <- apply(apply(scale(dat$data), 2, pnorm), 2, qbinom, size=1, prob=.5)

  ising.net <- function(Z, lambda, link='binomial') {
    p <- ncol(Z)
    l <- length(lambda)
    estFun <- function(i) {
      betamat      <- matrix(NA, p, l)
      betamat[-i,] <- as.matrix(glmnet::glmnet(Z[,-i], Z[,i], family=link, lambda=lambda)$beta)
      betamat
    }
    est <- parallel::mcmapply(estFun, 1:p, mc.cores=1, SIMPLIFY='array')
    list(path=apply(est, 2, function(x) { diag(x) <- 0 ; as(x!=0, "lgCMatrix") }))
  }

  lams <- getLamPath(.2, .005, 30)
  out  <- pulsar(X, ising.net, fargs=list(lambda=lams), criterion=c('stars', 'sufficiency'),
               subsample.ratio=.6, rep.num=60, seed=10010)

## ---- eval=TRUE, fig.width=7, fig.height=5-------------------------------
plot(lams, out$sufficiency$merge[1,], type='l', ylab="sufficiency")
points(lams, out$sufficiency$merge[4,], type='l', col='red')

## ---- eval=TRUE----------------------------------------------------------

  tandonest <- function(i, out, tu, tl) {
    rmerge <- out$sufficiency$merge
    p <- nrow(rmerge)
    l <- ncol(rmerge)
    prime  <- tail(which(rmerge[i,] > tu), 1)
    if (length(prime) == 0) return(rep(FALSE, p))
    naught <- tail(which(rmerge[i,1:prime] < tl), 1)
    if (length(naught) == 1) {
        pmerge <- out$stars$merge[[naught]][i,]
        return(pmerge >= (1+sqrt(1-4*tl))/2)
    } else return(rep(FALSE, p))
  }

  net <- sapply(1:p, tandonest, out=out, tu=.2, tl=.15)
  ## Symmetrize
  net <- sign(t(net) + net)

## ---- eval=TRUE, warning=FALSE, message=FALSE, fig.width=7, fig.height=5----
dat <- huge.generator(n, p, 'hub', verbose=FALSE, v=.1, u=.4)
out.diss  <- pulsar(dat$data, fargs=list(lambda=lams, verbose=FALSE),
                    rep.num=20, criterion=c('diss', 'stars'))
fit <- refit(out.diss, 'stars')
## Compute the max agglomerative coefficient over the full path
path.diss <- lapply(fit$est$path, pulsar:::graph.diss)
library(cluster)
acfun <- function(x) agnes(x, diss=TRUE)$ac
ac <- sapply(path.diss, acfun)
ac.sel <- out.diss$diss$merge[[which.max(ac)]]

## Estimate the diss bias
dissbias <- sapply(out.diss$diss$merge,
                   function(x) mean((x-ac.sel)^2)/2)
varbias  <- out.diss$diss$summary + dissbias

## Select the index and refit
opt.index(out.diss, 'diss') <- which.min(varbias)
fit.diss <- refit(out.diss)

plot(out.diss)
par(mfrow=c(1,2))
plot(network::network(as.matrix(fit.diss$refit$diss)), main='A-AGNES')
plot(network::network(as.matrix(fit.diss$refit$stars)), main='stars')

