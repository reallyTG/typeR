library(berryFunctions)


### Name: quantileMean
### Title: Average of R's quantile methods
### Aliases: quantileMean
### Keywords: univar

### ** Examples


exDat <- rnorm(30,sd=5)
quantile(exDat, probs=c(0.9, 0.99), type=1)
quantile(exDat, probs=c(0.9, 0.99), type=2)
round( sapply(1:9, function(m) quantile(exDat, probs=0.9, type=m)) , 3)
# and now the unweighted average:
quantileMean(exDat, probs=c(0.9, 0.99))
quantileMean(exDat, probs=0.9)
# say I trust type 2 and 3 especially and want to add a touch of 7:
quantileMean(exDat, probs=c(0.9, 0.99), weights=c(1,5,5,0,1,1,3,1,1))

# quantile sample size dependency simulation:
qbeta(p=0.999, 2, 9) # dist with Q99.9% = 0.62
betaPlot(2, 9, cumulative=FALSE)
abline(v=qbeta(p=0.999, 2, 9), col=6, lwd=3)
qm <- function(size) quantileMean(rbeta(size, 2,9), probs=0.999, names=FALSE)
n30  <- replicate(n=500, expr=qm(30))
n1000 <- replicate(n=500, expr=qm(1000))
lines(density(n30)) # with small sample size, high quantiles are systematically
lines(density(n1000), col=3) # underestimated. for Q0.999, n must be > 1000


## Not run: 
##D # #Excluded from CRAN Checks because of the long computing time
##D # median of 500 simulations:
##D qmm <- function(size, truncate=0) median(replicate(n=500,
##D        expr=quantileMean(rbeta(size, 2,9), probs=0.999, names=FALSE, truncate=truncate)))
##D 
##D n <- seq(10, 1000, length=30)
##D medians <- sapply(n, qmm)  # medians of regular quantile average
##D plot(n, medians, type="l", las=1)
##D abline(h=qbeta(p=0.999, 2, 9), col=6) # real value
##D # with truncation:
##D medians_trunc <- sapply(n, qmm, truncate=0.8) # only top 20% used for quantile estimation
##D lines(n, medians_trunc, col=2) # censored quantiles don't help!
##D # In small samples, rare high values do not occur on average
##D 
##D # Parametrical quantiles can avoid sample size dependency!
##D if(!require(devtools)) install.packages("devtools")
##D devtools::install_github("brry/extremeStat")
##D library("extremeStat")
##D library2("pbapply")
##D 
##D distLquantile(rbeta(1000, 2,9), probs=0.999, plot=TRUE, nbest=10) # 10 distribution functions
##D distLquantile(rbeta(1000, 2,9), probs=0.999, plot=TRUE, nbest=10) # that seem to work well
##D select <- c("wei","wak","pe3","ln3","kap","gno","gev","gum","gpa","gam")
##D 
##D pqmm <- function(size, truncate=0, plot=FALSE) median(replicate(n=50,
##D        expr=mean(distLquantile(rbeta(size, 2,9), probs=0.999, type=select,
##D           plot=plot, nbest=10, progbars=FALSE, time=FALSE, truncate=truncate))))
##D 
##D #dev.new(record=TRUE)
##D #pqmm(30, plot=TRUE)
##D 
##D # medians of parametrical quantile estimation
##D ###suppressMessages(pmedians <- pbsapply(n, pqmm) )  # takes several minutes
##D write.table(pmedians, file="../inst/extdata/pmedians.txt", row.names=FALSE, col.names=FALSE)
##D pmedians <- read.table("../inst/extdata/pmedians.txt")[,1]
##D 
##D plot(n, medians, type="l", ylim=c(0.4, 0.7), las=1)
##D abline(h=qbeta(p=0.999, 2, 9), col=6) # real value
##D lines(n, medians_trunc, col=2) # censored quantiles don't help!
##D lines(n, pmedians, col=4) # overestimated, but not dependent on n
##D # with truncation, only top 20% used for quantile estimation
##D suppressMessages(pmedians_trunc <- pbsapply(n[-1], pqmm, truncate=0.8))
##D lines(n[-1], pmedians_trunc, col=6) # much better!
##D # Good for this beta distribution. I don't know how it scales to other dists.
## End(Not run)




