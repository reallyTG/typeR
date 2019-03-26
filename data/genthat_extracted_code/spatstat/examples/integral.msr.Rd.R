library(spatstat)


### Name: integral.msr
### Title: Integral of a Measure
### Aliases: integral.msr
### Keywords: spatial math

### ** Examples

   fit <- ppm(cells ~ x)
   rr <- residuals(fit)
   integral(rr)

   # vector-valued measure
   rs <- residuals(fit, type="score")
   integral(rs)

   # multitype
   fitA <- ppm(amacrine ~ x)
   rrA <- residuals(fitA)
   sapply(split(rrA), integral)

   # multitype and vector-valued
   rsA <- residuals(fitA, type="score")
   sapply(split(rsA), integral)



