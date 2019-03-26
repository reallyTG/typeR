library(equate)


### Name: composite
### Title: Composite Linking and Equating
### Aliases: composite composite.default composite.equate.list
###   composite.list
### Keywords: methods

### ** Examples

# See vignette("equatevignette") for additional examples

# Example from the equate help file, without the bootstrapping
# Random groups equating for (1) identity, (2) mean, 
# (3) linear, (4) equipercentile with loglinear
# smoothing, and (5) a composite of mean and identity
rx <- as.freqtab(ACTmath[, 1:2])
ry <- as.freqtab(ACTmath[, c(1, 3)])
set.seed(2007)

req1 <- equate(rx, ry, type = "i")
req2 <- equate(rx, ry, type = "m")
req3 <- equate(rx, ry, type = "l")
req4 <- equate(rx, ry, type = "e", smooth = "loglin",
  degrees = 3)
req5 <- composite(list(req1, req2), wc = .5, symmetric = TRUE)

# Compare equating functions
plot(req1, req2, req3, req4, req5[[1]], addident = FALSE)




