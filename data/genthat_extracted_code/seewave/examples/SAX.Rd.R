library(seewave)


### Name: SAX
### Title: Symbolic Aggregate approXimation
### Aliases: SAX
### Keywords: ts

### ** Examples

data(tico)
spec <- soundscapespec(tico, plot=FALSE)[,2]
SAX(spec, alphabet = 5, PAA = 10)

# change breakpoints
SAX(spec,  alphabet = 5, PAA = 10, breakpoints="quantiles")
SAX(spec,  alphabet = 5, PAA = 10, breakpoints=c(0, 0.5, 0.75, 1))
SAX(spec,  alphabet = 5, PAA = 10, breakpoints=c(0, 0.33, 0.66, 1))

# different output formats
SAX(spec,  alphabet = 5, PAA = 10, collapse="")
SAX(spec,  alphabet = 5, PAA = 10, collapse="-")



