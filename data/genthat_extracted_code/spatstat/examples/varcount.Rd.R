library(spatstat)


### Name: varcount
### Title: Predicted Variance of the Number of Points
### Aliases: varcount
### Keywords: spatial models

### ** Examples

   fitT <- kppm(redwood ~ 1, "Thomas")
   B <- owin(c(0, 0.5), c(-0.5, 0))
   varcount(fitT, B)

   fitS <- ppm(swedishpines ~ 1, Strauss(9))
   BS <- square(50)
   varcount(fitS, BS)



