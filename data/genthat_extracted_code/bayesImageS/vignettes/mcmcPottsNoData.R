## ----setup, include=FALSE------------------------------------------------
library(bayesImageS)
set.seed(12)

## ----fig.cap="Chequerboard Gibbs sampling for a regular 8x8 lattice with k=3 labels."----
k <- 3
n <- 8*8
mask <- matrix(1,nrow=sqrt(n),ncol=sqrt(n))
neigh <- getNeighbors(mask, c(2,2,0,0))
block <- getBlocks(mask, 2)
edges <- getEdges(mask, c(2,2,0,0))
print(paste(sum(mask),"pixels"))
print(paste("maximum sufficient statistic S(z) =",nrow(edges)))
res.Gibbs <- mcmcPottsNoData(beta=5, k=3, neigh, block, niter=100)
ts.plot(res.Gibbs$sum, ylim=c(nrow(edges)/3, nrow(edges)))
abline(h=nrow(edges), col=2, lty=3)
summary(res.Gibbs$sum[51:100])
var(res.Gibbs$sum[51:100])

## ----fig.cap="Chequerboard Gibbs sampling for a regular 125x125 lattice with k=3 labels."----
n <- 125*125
mask <- matrix(1,nrow=sqrt(n),ncol=sqrt(n))
neigh <- getNeighbors(mask, c(2,2,0,0))
block <- getBlocks(mask, 2)
edges <- getEdges(mask, c(2,2,0,0))
print(paste(sum(mask),"pixels"))
print(paste("maximum sufficient statistic S(z) =",nrow(edges)))
res.Gibbs <- mcmcPottsNoData(beta=5, k=3, neigh, block, niter=2000)
ts.plot(res.Gibbs$sum, ylim=c(nrow(edges)/3, nrow(edges)))
abline(h=nrow(edges), col=2, lty=3)
summary(res.Gibbs$sum[1001:2000])
var(res.Gibbs$sum[1001:2000])

## ------------------------------------------------------------------------
res.SW <- swNoData(beta=5, k=3, neigh, block, niter=50)
ts.plot(res.SW$sum, ylim=c(nrow(edges)/3, nrow(edges)))
abline(h=nrow(edges), col=2, lty=3)
summary(res.SW$sum[26:50])
var(res.SW$sum[26:50])

## ------------------------------------------------------------------------
n <- 1000*1000
mask <- matrix(1,nrow=sqrt(n),ncol=sqrt(n))
neigh <- getNeighbors(mask, c(2,2,0,0))
block <- getBlocks(mask, 2)
edges <- getEdges(mask, c(2,2,0,0))
print(paste(sum(mask),"pixels"))
print(paste("maximum sufficient statistic S(z) =",nrow(edges)))
res.SW <- swNoData(beta=5, k=3, neigh, block, niter=100)
ts.plot(res.SW$sum, ylim=c(nrow(edges)/3, nrow(edges)))
abline(h=nrow(edges), col=2, lty=3)
summary(res.SW$sum[81:100])
var(res.SW$sum[81:100])

## ------------------------------------------------------------------------
n <- 125*125
mask <- matrix(1,nrow=sqrt(n),ncol=sqrt(n))
neigh <- getNeighbors(mask, c(2,2,0,0))
block <- getBlocks(mask, 2)
edges <- getEdges(mask, c(2,2,0,0))
system.time(res2.Gibbs <- mcmcPottsNoData(beta=0, k=3, neigh, block, niter=100, random=FALSE))
ts.plot(res2.Gibbs$sum, ylim=range(c(res2.Gibbs$sum, nrow(edges))))
abline(h=nrow(edges), col=2, lty=3)
abline(h=nrow(edges)/3, col=4, lty=3)
summary(res2.Gibbs$sum[51:100])
var(res2.Gibbs$sum[51:100])

## ------------------------------------------------------------------------
muSz <- nrow(edges)/3
sdSz <- sqrt(nrow(edges)*(1/3)*(2/3))
hist(res2.Gibbs$sum[51:100], freq=FALSE, breaks=20, col=3,
     xlim=range(c(res2.Gibbs$sum,muSz - 3*sdSz, muSz + 3*sdSz)))
abline(v=nrow(edges)/3, col=4, lty=3, lwd=3)
curve(dnorm(x, mean=nrow(edges)/3, sd=sqrt(nrow(edges)*(1/3)*(2/3))), 
          col="darkblue", lwd=2, lty=2, add=TRUE, yaxt="n")

## ------------------------------------------------------------------------
system.time(res2.SW <- swNoData(beta=0, k=3, neigh, block, niter=100, random=FALSE))
ts.plot(res2.SW$sum, ylim=range(c(res2.SW$sum, nrow(edges))))
abline(h=nrow(edges), col=2, lty=3)
abline(h=nrow(edges)/3, col=4, lty=3)
summary(res2.SW$sum[51:100])
var(res2.SW$sum[51:100])

## ------------------------------------------------------------------------
hist(res2.SW$sum[51:100], freq=FALSE, breaks=20, col=3,
     xlim=range(c(res2.Gibbs$sum,muSz - 3*sdSz, muSz + 3*sdSz)))
abline(v=nrow(edges)/3, col=4, lty=3, lwd=3)
curve(dnorm(x, mean=muSz, sd=sdSz), 
          col="darkblue", lwd=2, lty=2, add=TRUE, yaxt="n")

