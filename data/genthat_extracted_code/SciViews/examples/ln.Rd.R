library(SciViews)


### Name: ln
### Title: Logarithms.
### Aliases: ln ln1p lg lg1p E lb
### Keywords: datasets math

### ** Examples

ln(exp(3))              # Same as log(exp(3))
ln1p(c(0, 1, 10, 100))  # Wrapper for log1p()
lg(10^3)                # Same as log10(10^3)
lg1p(c(0, 1, 10, 100))  # log10(x + 1), but optimized for x << 1
E^4                     # Similar to exp(4), but different calculation!
lb(1:3)                 # Wrapper for log2()



