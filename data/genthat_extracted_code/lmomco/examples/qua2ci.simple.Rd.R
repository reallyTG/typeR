library(lmomco)


### Name: qua2ci.simple
### Title: Estimate a Confidence Interval for a Single Quantile of a Parent
###   Distribution by a Simple Algorithm
### Aliases: qua2ci qua2ci.simple
### Keywords: quantile function (confidence limit)

### ** Examples

## Not run: 
##D # It is well known that standard deviation (sigma) of the
##D # sample mean is equal to sigma/sample_size. Let is look at the
##D # quantile distribution of the median (f=0.5)
##D mean   <- 0; sigma <- 100
##D parent <- vec2par(c(mean,sigma), type='nor')
##D CI     <- qua2ci.simple(0.5, parent, n=10, nsim=20)
##D # Theoretrical sample mean sigma = 100/10 = 10
##D # L-moment theory: L-scale * sqrt(pi) = sigma
##D # Thus, it follows that the quantity
##D CI$elmoms$lambdas[2]/sqrt(pi)
##D # approaches 10 as nsim --> Inf.
## End(Not run)

# Another example.
D   <- c(123, 34, 4, 654, 37, 78, 93, 95, 120) # fake sample
lmr <- lmoms(D)    # compute the L-moments of the data
WEI <- parwei(lmr) # estimate Weibull distribution parameters
CI  <- qua2ci.simple(0.75,WEI,20, nsim=20, level=0.95)
# CI contains the estimate 95-percent confidence interval for the
# 75th-percentile of the parent Weibull distribution for 20 sample size 20.
## Not run: 
##D pdf("Substantial_qua2ci_example.pdf")
##D level <- 0.90; cilo <- (1-level)/2; cihi <- 1 - cilo
##D para <- lmom2par(vec2lmom(c(180,50,0.75)), type="gev")
##D A <- qua2ci.simple(0.98, para, 30, edist="gno", level=level, nsim=3000)
##D Apara <- A$epara; Aenv <- A$empdist
##D Bpara <- lmom2par(A$elmoms, type="aep4")
##D 
##D lo <- log10(A$lwr); hi <- log10(A$upr)
##D xs <- 10^(seq(lo-0.2, hi+0.2, by=0.005))
##D lo <- A$lwr; hi <- A$upr; xm <- A$true; sbar <- mean(Aenv$simquas)
##D dd <- density(Aenv$simquas, adjust=0.5)
##D pk <- max(dd$y, dlmomco(xs, Apara), dlmomco(xs, Bpara))
##D dx <- dd$x[dd$x >= Aenv$empir.dist.lower & dd$x <= Aenv$empir.dist.upper]
##D dy <- dd$y[dd$x >= Aenv$empir.dist.lower & dd$x <= Aenv$empir.dist.upper]
##D dx <- c(dx[1], dx, dx[length(dx)]); dy <- c(0, dy, 0)
##D 
##D plot(c(0), c(0), type="n", xlim=range(xs), ylim=c(0,pk),
##D                  xlab="X VALUE", ylab="PROBABILITY DENSITY")
##D polygon(dx, dy, col=8)
##D lines(xs, dlmomco(xs, Apara)); lines(xs, dlmomco(xs, Bpara), col=2, lwd=2)
##D lines(dd, lty=2, lwd=2, col=8)
##D lines(xs, dlmomco(xs, para), col=6); lines(c(xm,xm), c(0,pk), lty=4, lwd=3)
##D lines(c(lo,lo,NA,hi,hi), c(0,pk,NA,0,pk), lty=2)
##D 
##D xlo <- qlmomco(cilo, Apara); xhi <- qlmomco(cihi, Apara)
##D points(c(xlo, xhi), c(dlmomco(xlo, Apara), dlmomco(xhi, Apara)), pch=16)
##D xlo <- qlmomco(cilo, Bpara); xhi <- qlmomco(cihi, Bpara)
##D points(c(xlo, xhi), c(dlmomco(xlo, Bpara), dlmomco(xhi, Bpara)), pch=16, col=2)
##D lines(rep(Aenv$empir.dist.lwr, 2), c(0,pk), lty=3, lwd=2, col=3)
##D lines(rep(Aenv$empir.dist.upr, 2), c(0,pk), lty=3, lwd=2, col=3)
##D lines(rep(Aenv$bern.smooth.lwr,2), c(0,pk), lty=3, lwd=2, col=4)
##D lines(rep(Aenv$bern.smooth.upr,2), c(0,pk), lty=3, lwd=2, col=4)
##D cat(c(  "F(true) = ",             round(plmomco(xm,   Apara), digits=2),
##D       "; F(mean(sim), edist) = ", round(plmomco(sbar, Apara), digits=2), "\n"), sep="")
##D dev.off()
## End(Not run)
## Not run: 
##D ty <- "nor" # try running with "glo" (to get the L-skew "fit", see below)
##D para <- lmom2par(vec2lmom(c(-180,70,-.5)), type=ty)
##D f <- 0.99; n <- 41; ns <- 1000; Qtrue <- qlmomco(f, para)
##D Qsim1 <- replicate(ns, qlmomco(f, lmom2par(lmoms(rlmomco(n, para)), type=ty)))
##D Qsim2 <- qua2ci.simple(f, para, n, nsim=ns, edist="gno")
##D Qbar1 <- mean(Qsim1); Qbar2 <- mean(Qsim2$empdist$simquas)
##D epara <- Qsim2$epara; FT <- plmomco(Qtrue, epara)
##D F1 <- plmomco(Qbar1, epara); F2 <- plmomco(Qbar2, epara)
##D cat(c(  "F(true) = ",      round(FT, digits=2),
##D       "; F(via sim.) = ",  round(F1, digits=2),
##D       "; F(via edist) = ", round(F2, digits=2), "\n"), sep="")
##D # The given L-moments are highly skewed, but a Normal distribution is fit so
##D # L-skew is ignored. The game is deep tail (f=0.99) estimation. The true value of the
##D # quantile has a percentile on the error distribution 0.48 that is almost exactly 0.5
##D # (median = mean = symmetrical error distribution).  A test run shows nice behavior:
##D # F(true) =  0.48; F(via sim.) =  0.49; F(via edist) =  0.5
##D # But another run with ty <- "glo" (see how 0.36 << [0.52, 0.54]) has
##D # F(true) =  0.36; F(via sim.) =  0.54; F(via edist) =  0.52
##D # So as the asymmetry becomes extreme, the error distribution becomes asymmetrical too.
## End(Not run)



