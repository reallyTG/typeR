library(lmomco)


### Name: lmomcau
### Title: Trimmed L-moments of the Cauchy Distribution
### Aliases: lmomcau
### Keywords: L-moment (distribution) Distribution: Cauchy

### ** Examples

X1 <- rcauchy(20)
lmomcau(parcau(TLmoms(X1,trim=1)))



