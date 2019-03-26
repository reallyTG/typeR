library(RNGforGPD)


### Name: GenUniGpois
### Title: Generates Univariate Generalized Poisson Variates
### Aliases: GenUniGpois

### ** Examples

 GenUniGpois(2, 0.9, 100, method = "Branching")
 GenUniGpois(5, -0.4, 100, method = "Inversion")
 GenUniGpois(12, 0.5, 100, method = "Normal-Approximation")
 data <- GenUniGpois(10, 0.4, 10, method = "Chop-Down", details = FALSE)
 data <- GenUniGpois(3, 0.9, 10000, method = "Build-Up", details = FALSE)



