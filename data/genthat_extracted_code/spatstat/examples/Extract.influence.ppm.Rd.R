library(spatstat)


### Name: Extract.influence.ppm
### Title: Extract Subset of Influence Object
### Aliases: [.influence.ppm
### Keywords: spatial manip

### ** Examples

   fit <- ppm(cells, ~x)
   infl <- influence(fit)
   b <- owin(c(0.1, 0.3), c(0.2, 0.4))
   infl[b]
   infl[1:5]
   marks(as.ppp(infl))[1:3]



