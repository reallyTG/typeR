library(lmomco)


### Name: pars2x
### Title: Estimate Quantiles from an Ensemble of Parameters
### Aliases: pars2x
### Keywords: quantile function (from parameter ensemble)

### ** Examples

## Not run: 
##D # Simulate from GLO and refit it. Occasionally, the simulated data
##D # will result in MLE or MPS failing to converge, just a note to users.
##D # This example also shows the use of the attributes of the Results.
##D set.seed(3237)
##D x <- rlmomco(32, vec2par(c(2.5, 0.7, -0.39), type="glo"))
##D three.para.est <- x2pars(x, type="glo")
##D FF <- nonexceeds() # a range in nonexceedance probabilities
##D # In the event of MLE or MPS failure, one will see NA's in the Results.
##D Results <- pars2x(FF, three.para.est, na.rm=FALSE)
##D sum <- attr(Results, "all.summary")
##D plot(pp(x), sort(x), type="n", ylim=range(sum), log="y")
##D polygon(attr(Results, "f.poly"), attr(Results, "x.poly"), col=8, lty=0)
##D points(pp(x), sort(x), col=3)
##D lines(Results$f, Results$lmr,  col=1) # black line
##D lines(Results$f, Results$mle,  col=2) # red   line
##D lines(Results$f, Results$mps,  col=4) # blue  line
##D lines(Results$f, Results$mean, col=6, lty=2, lwd=2) # purple mean # 
## End(Not run)



