library(opticut)


### Name: uncertainty
### Title: Quantifying Uncertainty for Fitted Objects
### Aliases: uncertainty uncertainty.opticut uncertainty.multicut
###   print.uncertainty1 print.uncertainty print.summary.uncertainty
###   summary.uncertainty strata.uncertainty bestpart.uncertainty
###   bestpart.uncertainty1 check_strata as.data.frame.uncertainty
###   as.data.frame.summary.uncertainty bsmooth bsmooth.uncertainty1
###   bsmooth.uncertainty subset.uncertainty
### Keywords: manip models

### ** Examples

set.seed(2345)
n <- 50
x0 <- sample(1:4, n, TRUE)
x1 <- ifelse(x0 %in% 1:2, 1, 0)
x2 <- rnorm(n, 0.5, 1)
x3 <- ifelse(x0 %in% 2:4, 1, 0)
lam1 <- exp(0.5 + 1*x1 + -0.2*x2)
Y1 <- rpois(n, lam1)
lam2 <- exp(1 + 0.5*x3)
Y2 <- rpois(n, lam2)
Y3 <- rpois(n, exp(0))
Y <- cbind(Spp1=Y1, Spp2=Y2, Spp3=Y3)

oc <- opticut(Y ~ x2, strata=x0, dist="poisson", comb="rank")

## asymptotic confidence intervals
(uc1 <- uncertainty(oc, type="asymp", B=999))
summary(uc1)
## bootstrap-based confidence intervals
(uc2 <- uncertainty(oc, type="boot", B=19))
summary(uc2)

## use user-supplied indices
## multi-model bootstrap based uncertainties
B <- replicate(25, sample.int(n, replace=TRUE))
check_strata(oc, B) # check representation
(uc3 <- uncertainty(oc, type="multi", B=B))
summary(uc3)

## best partitions:
## selection frequencies for strata and species
bestpart(uc3)
heatmap(bestpart(uc3), scale="none", col=occolors()(25))

## bootstrap smoothed predictions per strata
bsmooth(uc3)
heatmap(bestpart(uc3), scale="none", col=occolors()(25))

## individual species results
uc3$uncertainty
bestpart(uc3$uncertainty[[1]])
bsmooth(uc3$uncertainty[[1]])

## Not run: 
##D ## block bootstrap
##D block_fun <- function()
##D     unlist(lapply(unique(x0), function(z) if (sum(x0==z) < 2)
##D         which(x0==z) else sample(which(x0==z), sum(x0==z), replace=TRUE)))
##D B <- replicate(25, block_fun())
##D check_strata(oc, B) # check representation
##D summary(uncertainty(oc, type="multi", B=B))
##D 
##D ## jackknife
##D B <- sapply(1:n, function(i) which((1:n) != i))
##D check_strata(oc, B) # check representation
##D summary(uncertainty(oc, type="multi", B=B))
##D 
##D ## multicut based uncertainty
##D mc <- multicut(Y ~ x2, strata=x0, dist="poisson")
##D 
##D ## asymptotic confidence intervals
##D (muc1 <- uncertainty(mc, type="asymp", B=999))
##D summary(muc1)
##D bestpart(muc1)
##D 
##D ## bootstrap-based confidence intervals
##D (muc2 <- uncertainty(mc, type="boot", B=19))
##D summary(muc2)
##D bestpart(muc2)
##D 
##D ## dolina example
##D data(dolina)
##D ## stratum as ordinal
##D dolina$samp$stratum <- as.integer(dolina$samp$stratum)
##D ## filter species to speed up things a bit
##D Y <- ifelse(dolina$xtab[,colSums(dolina$xtab > 0) >= 20] > 0, 1, 0)
##D ## opticut results, note the cloglog link function
##D dol <- opticut(Y ~ stratum + lmoist + method, data=dolina$samp,
##D     strata=dolina$samp$mhab, dist="binomial:cloglog")
##D 
##D ## parallel computing for uncertainty
##D library(parallel)
##D cl <- makeCluster(2)
##D ucdol <- uncertainty(dol, type="multi", B=25, cl=cl)
##D stopCluster(cl)
##D 
##D bestpart(ucdol)
##D heatmap(t(bestpart(ucdol)), scale="none", col=occolors()(25),
##D     distfun=function(x) dist(x, "manhattan"))
##D 
##D ## See how indicator value changes with different partitions
##D ## (and why it is the wrong metric to use in this calse)
##D with(ucdol$uncertainty[["pvic"]],
##D     boxplot(I ~ best, col="gold", ylab="Indicator value"))
##D ## What we should calculate is the bootstrap smoothed mean of the
##D ## expected value and its confidence intervals
##D bs <- bsmooth(ucdol$uncertainty[["pvic"]])
##D boxplot(t(bs), ylab="Expected value")
##D cbind(Mean=rowMeans(bs), t(apply(bs, 1, quantile, probs=c(0.025, 0.975))))
##D 
##D ## A more interesting simulated example for bootstrap smoothing
##D ## and comparing opticut vs. multicut
##D set.seed(1)
##D n <- 2000
##D x <- sort(runif(n, -8, 8))
##D p <- plogis(0.5 + -0.1 * x + -0.2 * x^2)
##D y <- rbinom(n, 1, p)
##D d <- diff(range(x))/10
##D br <- seq(min(x), max(x), by=d)
##D g <- cut(x, br, include.lowest=TRUE)
##D levels(g) <- LETTERS[1:nlevels(g)]
##D o <- opticut(y ~ 1, strata=g, dist="binomial")
##D m <- multicut(y ~ 1, strata=g, dist="binomial")
##D library(parallel)
##D cl <- makeCluster(2)
##D uo <- uncertainty(o, type="multi", B=99, cl=cl)
##D um <- uncertainty(m, type="boot", B=99, cl=cl)
##D stopCluster(cl)
##D ## bootstrap average for opticut
##D bs <- bsmooth(uo$uncertainty[[1]])
##D stat <- cbind(Mean=rowMeans(bs),
##D     t(apply(bs, 1, quantile, probs=c(0.025, 0.975))))
##D ## bootstrap average for multicut
##D bsm <- as.matrix(um$uncertainty[[1]][,-(1:2)])
##D statm <- cbind(Mean=colMeans(bsm),
##D     t(apply(bsm, 2, quantile, probs=c(0.025, 0.975))))
##D 
##D op <- par(mfrow=c(2,1))
##D plot(p ~ x, type="l", ylim=c(0,1), main="Binary partitions (opticut)")
##D abline(v=br, col="grey", lty=3)
##D lines(br[-1]-0.5*d, stat[,1], col=4)
##D lines(br[-1]-0.5*d, stat[,2], col=4, lty=2)
##D lines(br[-1]-0.5*d, stat[,3], col=4, lty=2)
##D lines(br[-1]-0.5*d, bs[,1], col=2)
##D legend("topright", bty="n", lty=c(1,1,2,1), col=c(1,4,4,2),
##D     legend=c("True response","bsmooth","0.95 CI","Best partition"))
##D 
##D plot(p ~ x, type="l", ylim=c(0,1), main="Multi-level model (multicut)")
##D abline(v=br, col="grey", lty=3)
##D lines(br[-1]-0.5*d, statm[,1], col=4)
##D lines(br[-1]-0.5*d, statm[,2], col=4, lty=2)
##D lines(br[-1]-0.5*d, statm[,3], col=4, lty=2)
##D legend("topright", bty="n", lty=c(1,1,2), col=c(1,4,4),
##D     legend=c("True response","bsmooth","0.95 CI"))
##D par(op)
## End(Not run)



