library(extremeStat)


### Name: distLquantile
### Title: distribution quantiles
### Aliases: distLquantile
### Keywords: distribution robust univar

### ** Examples


data(annMax) # Annual Discharge Maxima (streamflow)

distLquantile(annMax, emp=FALSE)[,] # several distribution functions in lmomco
distLquantile(annMax, truncate=0.8, probs=0.95)[,] # POT (annMax already block maxima)
dlf <- distLquantile(annMax, probs=0.95, list=TRUE)
plotLquantile(dlf, linargs=list(lwd=3), nbest=5, breaks=10)
dlf$quant
# Parametric 95% quantile estimates range from 92 to 111!
# But the best fitting distributions all lie aroud 103.

# compare General Pareto Fitting methods
# Theoretically, the tails of distributions converge to GPD (General Pareto)
# q_gpd compares several R packages for fitting and quantile estimation:
dlq <- distLquantile(annMax, weighted=FALSE, quiet=TRUE, probs=0.97, list=TRUE)
dlq$quant
plotLquantile(dlq) # per default best fitting distribution functions
plotLquantile(dlq, row=c("wak","GPD*"), nbest=14)
#pdf("dummy.pdf", width=9)
plotLquantile(dlq, row="GPD*", nbest=13, xlim=c(102,110),
          linargs=list(lwd=3), heights=seq(0.02, 0.005, len=14))
#dev.off()


## Not run: 
##D ## Taken out from CRAN package check because it's slow
##D 
##D # Sanity checks: important for very small samples:
##D x1 <- c(2.6, 2.5, 2.9, 3, 5, 2.7, 2.7, 5.7, 2.8, 3.1, 3.6, 2.6, 5.8, 5.6, 5.7, 5.3)
##D q1 <- distLquantile(x1, sanerange=c(0,500), sanevals=c(NA,500))
##D x2 <- c(6.1, 2.4, 4.1, 2.4, 6, 6.3, 2.9, 6.8, 3.5)
##D q2 <- distLquantile(x2, sanerange=c(0,500), sanevals=c(NA,500), quiet=FALSE)
##D x3 <- c(4.4, 3, 1.8, 7.3, 2.1, 2.1, 1.8, 1.8)
##D q3 <- distLquantile(x3, sanerange=c(0,500), sanevals=c(NA,500))
##D 
##D # weighted distribution quantiles are calculated by different weighting schemes:
##D plotLweights(dlf)
##D 
##D # If speed is important and parameters are already available, pass them via dlf:
##D distLquantile(dlf=dlf, probs=0:5/5, selection=c("wak","gev","kap"))
##D distLquantile(dlf=dlf, truncate=0.3, list=TRUE)$truncate
##D 
##D # censored (truncated, trimmed) quantile, Peak Over Treshold (POT) method:
##D qwak <- distLquantile(annMax, sel="wak", prob=0.95, emp=FALSE, list=TRUE)
##D plotLquantile(qwak, ylim=c(0,0.06) ); qwak$quant
##D qwak2 <-distLquantile(annMax, sel="wak", prob=0.95, emp=FALSE, list=TRUE, truncate=0.6)
##D plotLquantile(qwak2, add=TRUE, distcols="blue")
##D 
##D 
##D # Simulation of truncation effect
##D library(lmomco)
##D #set.seed(42)
##D rnum <- rlmomco(n=1e3, para=dlf$parameter$gev)
##D myprobs <- c(0.9, 0.95, 0.99, 0.999)
##D mytrunc <- seq(0, 0.9, length.out=20)
##D trunceffect <- sapply(mytrunc, function(mt) distLquantile(rnum, selection="gev",
##D                              probs=myprobs, truncate=mt, quiet=TRUE,
##D                              pempirical=FALSE)["gev",])
##D # If more values are truncated, the function runs faster
##D 
##D op <- par(mfrow=c(2,1), mar=c(2,4.5,2,0.5), cex.main=1)
##D dlf1 <- distLquantile(rnum, sel="gev", probs=myprobs, emp=FALSE, list=TRUE)
##D dlf2 <- distLquantile(rnum, sel="gev", probs=myprobs, emp=FALSE, list=TRUE, truncate=0.3)
##D plotLquantile(dlf1, ylab="", xlab="")
##D plotLquantile(dlf2, add=TRUE, distcols=4)
##D legend("right", c("fitted GEV", "fitted with truncate=0.3"), lty=1, col=c(2,4), bg="white")
##D par(mar=c(3,4.5,3,0.5))
##D plot(mytrunc, trunceffect[1,], ylim=range(trunceffect), las=1, type="l",
##D      main=c("High quantiles of 1000 random numbers from gev distribution",
##D            "Estimation based on proportion of lower values truncated"),
##D      xlab="", ylab="parametric quantile")
##D title(xlab="Proportion censored", mgp=c(1.8,1,0))
##D for(i in 2:4) lines(mytrunc, trunceffect[i,])
##D library("berryFunctions")
##D textField(rep(0.5,4), trunceffect[,11], paste0("Q",myprobs*100,"%") )
##D par(op)
##D 
##D trunc <- seq(0,0.1,len=200)
##D dd <- pbsapply(trunc, function(t) distLquantile(annMax,
##D           selection="gpa", weight=FALSE, truncate=t, prob=0.99, quiet=T)[c(1,3),])
##D  plot(trunc, dd[1,], type="o", las=1)
##D lines(trunc, dd[2,], type="o", col=2)
##D 
##D 
##D set.seed(3); rnum <- rlmomco(n=1e3, para=dlf$parameter$gpa)
##D qd99 <- evir::quant(rnum, p=0.99, start=15, end=1000, ci=0.5, models=30)
##D axis(3, at=seq(-1000,0, length=6), labels=0:5/5, pos=par("usr")[3])
##D title(xlab="Proportion truncated", line=-3)
##D mytrunc <- seq(0, 0.9, length.out=30)
##D trunceffect <- sapply(mytrunc, function(mt) distLquantile(rnum, selection="gpa",
##D                       probs=0.99, truncate=mt, plot=FALSE, quiet=TRUE,
##D                       empirical=FALSE, gpd=TRUE))
##D lines(-1000*(1-mytrunc), trunceffect[1,], col=4)
##D lines(-1000*(1-mytrunc), trunceffect[2,], col=3) # interesting...
##D for(i in 3:13) lines(-1000*(1-mytrunc), trunceffect[i,], col=3) # interesting...
##D 
##D # If you want the estimates only for one single truncation, use
##D q_gpd(rnum, probs=myprobs, truncate=0.5)
##D 
## End(Not run) # end dontrun




