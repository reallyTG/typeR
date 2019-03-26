library(bamlss)


### Name: BayesX
### Title: Markov Chain Monte Carlo for BAMLSS using 'BayesX'
### Aliases: BayesX BayesX.control sx tx tx2 tx3 tx4 get_BayesXsrc
###   quant_bamlss smooth.construct.tensorX.smooth.spec
###   Predict.matrix.tensorX.smooth smooth.construct.tensorX3.smooth.spec
###   Predict.matrix.tensorX3.smooth
### Keywords: regression

### ** Examples

## Get newest version of BayesXsrc.
## Note: needs sh, svn and R build tools!
## get_BayesXsrc()
## Not run: 
##D if(require("BayesXsrc")) {
##D   ## Simulate some data
##D   set.seed(123)
##D   d <- GAMart()
##D 
##D   ## Estimate model with BayesX. Note
##D   ## that BayesX computes starting values, so
##D   ## these are not required by some optimizer function
##D   ## in bamlss()
##D   b1 <- bamlss(num ~ s(x1) + s(x2) + s(x3) + s(lon,lat),
##D     data = d, optimizer = FALSE, sampler = BayesX)
##D 
##D   plot(b1)
##D 
##D   ## Same model with anisotropic penalty.
##D   b2 <- bamlss(num ~ s(x1) + s(x2) + s(x3) + tx(lon,lat),
##D     data = d, optimizer = FALSE, sampler = BayesX)
##D 
##D   plot(b2)
##D 
##D   ## Quantile regression.
##D   b3_0.1 <- bamlss(num ~ s(x1) + s(x2) + s(x3) + tx(lon,lat),
##D     data = d, optimizer = FALSE, sampler = BayesX,
##D     family = gF("quant", prob = 0.1))
##D 
##D   b3_0.9 <- bamlss(num ~ s(x1) + s(x2) + s(x3) + tx(lon,lat),
##D     data = d, optimizer = FALSE, sampler = BayesX,
##D     family = gF("quant", prob = 0.9))
##D 
##D   ## Predict quantiles.
##D   p_0.1 <- predict(b3_0.1, term = "s(x2)")
##D   p_0.9 <- predict(b3_0.9, term = "s(x2)")
##D 
##D   ## Plot.
##D   plot2d(p_0.1 + p_0.9 ~ x2, data = d)  
##D }
## End(Not run)



