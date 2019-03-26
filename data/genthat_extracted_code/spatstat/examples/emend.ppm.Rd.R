library(spatstat)


### Name: emend.ppm
### Title: Force Point Process Model to be Valid
### Aliases: emend.ppm project.ppm
### Keywords: spatial models

### ** Examples

   fit <- ppm(redwood ~1, Strauss(0.1))
   coef(fit)
   fit2 <- emend(fit)
   coef(fit2)



