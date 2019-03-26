library(lmomco)


### Name: partexp
### Title: Estimate the Parameters of the Truncated Exponential
###   Distribution
### Aliases: partexp
### Keywords: distribution (parameters) Distribution: Exponential (trimmed)

### ** Examples

# truncated exponential is a nonstationary poisson process
A  <- partexp(vec2lmom(c(100, 1/2),   lscale=FALSE)) # pure exponential
B  <- partexp(vec2lmom(c(100, 0.499), lscale=FALSE)) # almost exponential
BB <- partexp(vec2lmom(c(100, 0.45),  lscale=FALSE)) # truncated exponential
C  <- partexp(vec2lmom(c(100, 1/3),   lscale=FALSE)) # stationary poisson process
D  <- partexp(vec2lmom(c(100, 40))) # truncated exponential



