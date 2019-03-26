library(analogue)


### Name: n2
### Title: Calculate Hill's N2 diversity measure
### Aliases: n2 n2.default
### Keywords: methods multivariate utilities

### ** Examples

data(swapdiat)
sppN2 <- n2(swapdiat, "species")
head(sppN2)
sampN2 <- n2(swapdiat, "sites")
head(sampN2)



