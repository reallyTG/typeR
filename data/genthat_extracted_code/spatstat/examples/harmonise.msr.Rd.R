library(spatstat)


### Name: harmonise.msr
### Title: Make Measures Compatible
### Aliases: harmonise.msr
### Keywords: spatial manip

### ** Examples

  fit1 <- ppm(cells ~ x)
  fit2 <- ppm(rpoispp(ex=cells) ~ x)
  m1 <- residuals(fit1)
  m2 <- residuals(fit2)
  harmonise(m1, m2)
  s1 <- residuals(fit1, type="score")
  s2 <- residuals(fit2, type="score")
  harmonise(s1, s2)



