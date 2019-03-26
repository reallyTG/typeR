library(fractal)


### Name: chaoticInvariant
### Title: Class for chaotic invariant objects
### Aliases: chaoticInvariant eda.plot.chaoticInvariant
###   plot.chaoticInvariant print.chaoticInvariant
###   print.summary.chaoticInvariant
### Keywords: methods

### ** Examples

## create a faux object of class chaoticInvariant 
faux.data <- list(matrix(rnorm(1024), ncol=2), matrix(1:512))
chaoticInvariant(faux.data,
    dimension   = 1:2,
    n.embed     = 10,
    n.reference = 50,
    n.neighbor  = 35,
    tlag        = 10,
    olag        = 15,
    resolution  = 2,
    series.name = "my series",
    series      = 1:10,
    ylab        = "log2(C2)",
    xlab        = "log2(scale)",
    metric      = Inf,
    invariant   = "correlation dimension")



