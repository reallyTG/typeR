library(lmomco)


### Name: pargep
### Title: Estimate the Parameters of the Generalized Exponential Poisson
###   Distribution
### Aliases: pargep
### Keywords: distribution (parameters) Distribution: Generalized
###   Exponential Poisson

### ** Examples

## Not run: 
##D # Two examples well inside the domain but known to produce difficulty in
##D # the optimization process; pargep() engineered with flexibility to usually
##D # hit the proper solutions.
##D mygepA <- pargep(vec2lmom(c(1,0.305,0.270), lscale=FALSE))
##D mygepB <- pargep(vec2lmom(c(1,0.280,0.320), lscale=FALSE))
## End(Not run)
## Not run: 
##D gep1 <- vec2par(c(2708, 3, 52), type="gep")
##D  lmr <- lmomgep(gep1);  print(lmr$lambdas)
##D gep2 <- pargep(lmr);    print(lmomgep(gep2)$lambdas)
##D # Note that we are close on matching the L-moments but we do
##D # not recover the parameters given because to shape parameters.
##D gep3 <- pargep(lmr, nk=1, nh=2);
##D x <- quagep(nonexceeds(), gep1)
##D x <- sort(c(x, quagep(nonexceeds(), gep2)))
##D plot(x, pdfgep(x, gep1), type="l", lwd=2)
##D lines(x, pdfgep(x, gep2), lwd=3, col=2)
##D lines(x, pdfgep(x, gep3), lwd=2, col=3)
## End(Not run)



