library(lmomco)


### Name: pargam
### Title: Estimate the Parameters of the Gamma Distribution
### Aliases: pargam
### Keywords: distribution (parameters) Distribution: Gamma Distribution:
###   Generalized Gamma

### ** Examples

pargam(lmoms(abs(rnorm(20, mean=10))))

## Not run: 
##D pargam(lmomgam(vec2par(c(0.3,0.4,+1.2), type="gam")), p=3)$para
##D pargam(lmomgam(vec2par(c(0.3,0.4,-1.2), type="gam")), p=3)$para
##D #        mu      sigma         nu 
##D # 0.2999994  0.3999990  1.1999696
##D # 0.2999994  0.4000020 -1.2000567
## End(Not run)



