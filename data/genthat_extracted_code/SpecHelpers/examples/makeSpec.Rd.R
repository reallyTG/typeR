library(SpecHelpers)


### Name: makeSpec
### Title: Draw a Chromatogram or Spectrum
### Aliases: makeSpec
### Keywords: utilities

### ** Examples


### A simple chromatogram

chrom <- data.frame(mu = c(2, 5, 11), sd = c(0.5, 1, 2),
area = c(1, 0.5, 1), tail =  c(NA, NA, 0.1))
ex1 <- makeSpec(chrom, x.range = c(0, 20), plot = TRUE, curves = TRUE,
dd = 5, main = "Chromatogram with Underlying Pure Curves")

### Faux ethyl group NMR with J = 0.1 ppm.
# Note that a much better
# NMR spectrum can be generated using plotNMRspec which also uses
# a more natural input format
#
spec <- data.frame(mu = c(3.5, 3.4, 3.3, 3.2, 1.4, 1.3, 1.2),
sd = rep(0.01, 7), tail =  rep(NA, 7),
area = c(1, 3, 3, 1, 1, 2, 1) * c(0.5, 0.5, 0.5, 0.5, 0.66, 0.66, 0.66))
ex2 <- makeSpec(spec, x.range = c(5, 0), plot = TRUE, curves = FALSE,
dd = 100, main = "Simulated 1H NMR of an Ethyl Group")




