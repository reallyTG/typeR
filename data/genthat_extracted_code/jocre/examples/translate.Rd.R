library(jocre)


### Name: translate
### Title: Conversion of confidence levels between intervals and ellipses
### Aliases: translate
### Keywords: multivariate

### ** Examples

# Get CIGE level
translate(0.95, ddf=1, "ci2cr")
translate(0.95, ddf=9999, "ci2cr")
translate(0.95, ddf=0, "ci2cr")

# Get Scheffe CI level
translate(0.95, ddf=1, "cr2ci")
translate(0.95, ddf=9999, "cr2ci")
translate(0.95, ddf=0, "cr2ci")



