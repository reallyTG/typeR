library(CLA)


### Name: CLA
### Title: Critical Line Algorithm for mean-variance optimal portfolio
### Aliases: CLA
### Keywords: optimize arith

### ** Examples

data(muS.sp500)
## Full data taking too much time for example
set.seed(47)
iS <- sample.int(length(muS.sp500$mu), 24)

CLsp.24 <- CLA(muS.sp500$mu[iS], muS.sp500$covar[iS, iS], lB=0, uB=1/10)
CLsp.24 # using the print() method for class "CLA"

plot(CLsp.24)

if(require(Matrix)) { ## visualize how weights change "along turning points"
  show(image(Matrix(CLsp.24$weights_set, sparse=TRUE),
             main = "CLA(muS.sp500 <random_sample(size=24)>) $ weights_set",
             xlab = "turning point", ylab = "asset number"))
}



