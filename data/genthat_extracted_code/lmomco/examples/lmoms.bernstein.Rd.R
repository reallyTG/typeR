library(lmomco)


### Name: lmoms.bernstein
### Title: Numerically Integrated L-moments of Smoothed Quantiles from
###   Bernstein or Kantorovich Polynomials
### Aliases: lmoms.bernstein
### Keywords: L-moment (theoretical) smoothing (Bernstein-Kantorovich)

### ** Examples

## Not run: 
##D X <- exp(rnorm(100))
##D lmoms.bernstein(X)$ratios
##D lmoms.bernstein(X, fix.lower=0)$ratios
##D lmoms.bernstein(X, fix.lower=0, bound.type="sd")$ratios
##D lmoms.bernstein(X, fix.lower=0, bound.type="Carv")$ratios
##D lmoms(X)$ratios
##D 
##D lmoms.bernstein(X, poly.type="Kantorovich")$ratios
##D lmoms.bernstein(X, fix.lower=0, poly.type="Kantorovich")$ratios
##D lmoms.bernstein(X, fix.lower=0, bound.type="sd", poly.type="Kantorovich")$ratios
##D lmoms.bernstein(X, fix.lower=0, bound.type="Carv", poly.type="Kantorovich")$ratios
##D lmoms(X)$ratios
## End(Not run)

## Not run: 
##D lmr <- vec2lmom(c(1,.2,.3))
##D par <- lmom2par(lmr, type="gev")
##D lmr <- lmorph(par2lmom(par))
##D lmT <- c(lmr$lambdas[1:2], lmr$ratios[3:5])
##D ns  <- 200; nsim <- 1000; empty <- rep(NA, nsim)
##D 
##D sink("ChengLmomentTest.txt")
##D cat(c("N errmeanA  errlscaleA  errtau3A  errtau4A  errtau5A",
##D         "errmeanB  errlscaleB  errtau3B  errtau4B  errtau5B\n"))
##D for(n in 1:ns) {
##D    message(n);
##D    SIM <- data.frame(errmeanA=empty, errlscaleA=empty,   errtau3A=empty, errtau4A=empty,
##D                      errtau5A=empty,   errmeanB=empty, errlscaleB=empty, errtau3B=empty,
##D                      errtau4B=empty,   errtau5B=empty)
##D    for(i in 1:nsim) {
##D       X <- rlmomco(30, par)
##D       lmrA <- lmoms(X)
##D       lmA <- c(lmrA$lambdas[1:2], lmrA$ratios[3:5])
##D       lmrB <- lmoms.bernstein(X, poly.type="Cheng")
##D       lmB <- c(lmrB$lambdas[1:2], lmrB$ratios[3:5])
##D       EA <- lmA - lmT; EB <- lmB - lmT
##D       SIM[i,] <- c(EA,EB)
##D    }
##D    MeanErr <- sapply(1:length(SIM[1,]), function(x) { return(mean(SIM[,x])) })
##D    line <- paste(c(n, round(MeanErr, digits=6), "\n"), sep=" ")
##D    cat(line)
##D }
##D sink()
## End(Not run)



