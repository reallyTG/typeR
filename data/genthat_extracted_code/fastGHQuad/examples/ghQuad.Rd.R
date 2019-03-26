library(fastGHQuad)


### Name: ghQuad
### Title: Convenience function for Gauss-Hermite quadrature
### Aliases: ghQuad
### Keywords: math

### ** Examples


# Get quadrature rules
rule10  <- gaussHermiteData(10)
rule100 <- gaussHermiteData(100)

# Check that rule is implemented correctly
f <- function(x) rep(1,length(x))
if (!isTRUE(all.equal(sqrt(pi), ghQuad(f, rule10), ghQuad(f, rule100)))) {
  print(ghQuad(f, rule10))
  print(ghQuad(f, rule100))
}
# These should be 1.772454

f <- function(x) x
if (!isTRUE(all.equal(0.0, ghQuad(f, rule10), ghQuad(f, rule100)))) {
  print(ghQuad(f, rule10))
  print(ghQuad(f, rule100))
}
# These should be zero





