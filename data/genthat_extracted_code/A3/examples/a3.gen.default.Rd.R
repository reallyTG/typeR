library(A3)


### Name: a3.gen.default
### Title: Stochastic Data Generators
### Aliases: a3.gen.autocor a3.gen.bootstrap a3.gen.default a3.gen.normal
###   a3.gen.resample

### ** Examples

## No test: 
 # Calculate the A3 results assuming an auto-correlated set of observations.
 # In usage p.acc should be <=0.01 in order to obtain more accurate p values.

 a3.lm(rating ~ ., attitude, p.acc = 0.1,
   data.generating.fn = replicate(ncol(attitude), a3.gen.autocor))
 
## End(No test)

 ## A general illustration:

 # Take x as a sample set of observations for a feature
 x <- c(0.349, 1.845, 2.287, 1.921, 0.803, 0.855, 2.368, 3.023, 2.102, 4.648)

 # Generate three stochastic data series with the same autocorrelation properties as x
 rand.x <- a3.gen.autocor(x, 3)

 plot(x, type="l")
 for(i in 1:3) lines(rand.x[[i]], lwd = 0.2)



