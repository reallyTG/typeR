library(extremeStat)


### Name: q_gpd
### Title: GPD quantile of sample
### Aliases: q_gpd
### Keywords: distribution robust univar

### ** Examples

data(annMax)
q_gpd(annMax)
q_gpd(annMax, truncate=0.6)
q_gpd(annMax, truncate=0.85)
q_gpd(annMax, truncate=0.91)

q_gpd(annMax, package="evir")
q_gpd(annMax, package="evir", method="ml")
q_gpd(annMax, package="evd")
q_gpd(annMax, package="extRemes")
q_gpd(annMax, package="extRemes", method="GMLE")
#q_gpd(annMax, package="extRemes", method="Bayesian") # computes a while
q_gpd(annMax, package="extRemes", method="Lmoments")
q_gpd(annMax, package="extRemes", method="nonsense") # NAs
q_gpd(annMax, package="fExtremes")                   # log warnings
q_gpd(annMax, package="fExtremes", efquiet=TRUE)    # silenced warnings
q_gpd(annMax, package="fExtremes", method= "mle")
q_gpd(annMax, package="ismev")
q_gpd(annMax, package="Renext")
q_gpd(annMax, package="Renext", method="f")
berryFunctions::is.error(q_gpd(annMax, package="nonsense"), force=TRUE)

# compare all at once with
d <- distLquantile(annMax); d
# d <- distLquantile(annMax, speed=FALSE); d # for Bayesian also

q_gpd(annMax, truncate=0.85, package="evd")          # Note about quantiles
q_gpd(annMax, truncate=0.85, package="evir")
q_gpd(annMax, truncate=0.85, package="evir", quiet=TRUE) # No note
q_gpd(annMax, truncate=0.85, package="evir", undertruncNA=FALSE)

q_gpd(annMax, truncate=0.85, package="evir", list=TRUE)
str(  q_gpd(annMax, truncate=0.85, probs=0.6, package="evir", list=TRUE) )# NAs
str(  q_gpd(annMax, package="evir",      list=TRUE)   )
str(  q_gpd(annMax, package="evd",       list=TRUE)   )
str(  q_gpd(annMax, package="extRemes",  list=TRUE)   )
str(  q_gpd(annMax, package="fExtremes", list=TRUE)   )
str(  q_gpd(annMax, package="ismev",     list=TRUE)   )
str(  q_gpd(annMax, package="Renext",    list=TRUE)   )

q_gpd(annMax, package="evir", truncate=0.9, method="ml") # NAs (MLE fails often)

trunc <- seq(0,0.9,len=500)
library("pbapply")
quant <- pbsapply(trunc, function(tr) q_gpd(annMax, pack="evir", method = "pwm",
                                            truncate=tr, quiet=TRUE))
quant <- pbsapply(trunc, function(tr) q_gpd(annMax, pack="lmomco", truncate=tr, quiet=TRUE))
plot(trunc, quant["99%",], type="l", ylim=c(80,130), las=1)
lines(trunc, quant["90%",])
lines(trunc, quant["80%",])
plot(trunc, quant["RMSE",], type="l", las=1)

## Not run: 
##D ## Not run in checks because simulation takes too long
##D 
##D trunc <- seq(0,0.9,len=200)
##D dlfs <- pblapply(trunc, function(tr) distLfit(annMax, truncate=tr, quiet=TRUE, order=FALSE))
##D rmses <- sapply(dlfs, function(x) x$gof$RMSE)
##D plot(trunc, trunc, type="n", ylim=range(rmses,na.rm=TRUE), las=1, ylab="rmse")
##D cols <- rainbow2(17)[rank(rmses[,1])]
##D for(i in 1:17) lines(trunc, rmses[i,], col=cols[i])
##D 
##D dlfs2 <- lapply(0:8/10, function(tr) distLfit(annMax, truncate=tr, quiet=TRUE))
##D pdf("dummy.pdf")
##D dummy <- sapply(dlfs2, function(x)
##D {plotLfit(x, cdf=TRUE, main=x$truncate, ylim=0:1, xlim=c(20,135), nbest=1)
##D title(sub=round(x$gof$RMSE[1],4))
##D })
##D dev.off()
##D 
##D # truncation effect
##D mytruncs <- seq(0, 0.9, len=150)
##D oo <- options(show.error.messages=FALSE, warn=-1)
##D myquants <- sapply(mytruncs, function(t) q_gpd(annMax, truncate=t, quiet=TRUE))
##D options(oo)
##D plot(1, type="n", ylim=range(myquants, na.rm=TRUE), xlim=c(0,0.9), las=1,
##D      xlab="truncated proportion", ylab="estimated quantiles")
##D abline(h=quantileMean(annMax, probs=c(0.8,0.9,0.99)))
##D for(i in 1:3) lines(mytruncs, myquants[i,], col=i)
##D text(0.3, c(87,97,116), rownames(myquants), col=1:3)
##D 
##D 
##D # Underestimation in small samples
##D # create known population:
##D dat <- extRemes::revd(1e5, scale=50, shape=-0.02, threshold=30, type="GP")
##D op <- par(mfrow=c(1,2), mar=c(2,2,1,1))
##D hist(dat, breaks=50, col="tan")
##D berryFunctions::logHist(dat, breaks=50, col="tan")
##D par(op)
##D 
##D # function to estimate empirical and GPD quantiles from subsamples
##D samsizeeffect <- function(n, nrep=30, probs=0.999, trunc=0.5, Q=c(0.4,0.5,0.6))
##D {
##D res <- replicate(nrep, {
##D subsample <- sample(dat, n)
##D qGPD <- q_gpd(subsample, probs=probs, truncate=trunc)
##D qEMP <- berryFunctions::quantileMean(subsample, probs=probs, truncate=trunc)
##D c(qGPD=qGPD, qEMP=qEMP)})
##D apply(res, MARGIN=1, berryFunctions::quantileMean, probs=Q)
##D }
##D 
##D # Run and plot simulations
##D samplesize <- c(seq(20, 150, 10), seq(200,800, 100))
##D results <- pbapply::pblapply(samplesize, samsizeeffect)
##D res <- function(row, col) sapply(results, function(x) x[row,col])
##D berryFunctions::ciBand(yu=res(3,1),yl=res(1,1),ym=res(2,1),x=samplesize,
##D   main="99.9% Quantile underestimation", xlab="subsample size", ylim=c(200,400), colm=4)
##D berryFunctions::ciBand(yu=res(3,2),yl=res(1,2),ym=res(2,2),x=samplesize, add=TRUE)
##D abline(h=berryFunctions::quantileMean(dat, probs=0.999))
##D text(300, 360, "empirical quantile of full sample")
##D text(300, 340, "GPD parametric estimate", col=4)
##D text(300, 300, "empirical quantile estimate", col="green3")
##D 
## End(Not run) # end of dontrun




