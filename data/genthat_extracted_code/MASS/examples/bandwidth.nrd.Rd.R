library(MASS)


### Name: bandwidth.nrd
### Title: Bandwidth for density() via Normal Reference Distribution
### Aliases: bandwidth.nrd
### Keywords: dplot

### ** Examples

# The function is currently defined as
function(x)
{
    r <- quantile(x, c(0.25, 0.75))
    h <- (r[2] - r[1])/1.34
    4 * 1.06 * min(sqrt(var(x)), h) * length(x)^(-1/5)
}



