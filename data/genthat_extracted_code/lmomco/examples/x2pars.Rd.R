library(lmomco)


### Name: x2pars
### Title: Estimate an Ensemble of Parameters from Three Different Methods
### Aliases: x2pars
### Keywords: parameter (L-moments to) parameter (maximum likelihood to)
###   parameter (maximum product spacing to) parameter (estimation)

### ** Examples

## Not run: 
##D # Simulate from GLO and refit it. Occasionally, the simulated data
##D # will result in MLE or MPS failing to converge, just a note to users.
##D set.seed(3237)
##D x <- rlmomco(126, vec2par(c(2.5, 0.7, 0.3), type="glo"))
##D three.para.est <- x2pars(x, type="glo")
##D print(three.para.est$lmr$para) # 2.5598083 0.6282518 0.1819538
##D print(three.para.est$mle$para) # 2.5887340 0.6340132 0.2424734
##D print(three.para.est$mps$para) # 2.5843058 0.6501916 0.2364034
## End(Not run)



