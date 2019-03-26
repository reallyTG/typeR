library(ROptEstOld)


### Name: GumbelLocationFamily
### Title: Generating function for Gumbel location families
### Aliases: GumbelLocationFamily
### Keywords: models

### ** Examples

distrExOptions("ElowerTruncQuantile" = 1e-15) # problem with 
                                            # non-finite function value
(G1 <- GumbelLocationFamily())
plot(G1)
Map(L2deriv(G1)[[1]])
checkL2deriv(G1)
distrExOptions("ElowerTruncQuantile" = 0) # default



