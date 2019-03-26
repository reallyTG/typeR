library(lmomco)


### Name: check.pdf
### Title: Check and Potentially Graph Probability Density Functions
### Aliases: check.pdf
### Keywords: utility (distribution) Graphics

### ** Examples

lmrg <- vec2lmom(c( 100, 40, 0.1)) # Arbitrary L-moments
lmrw <- vec2lmom(c(-100, 40,-0.1)) # Reversed Arbitrary L-moments
gev  <- pargev(lmrg) # parameters of Generalized Extreme Value distribution
wei  <- parwei(lmrw) # parameters of Weibull distribution

# The Weibull is a reversed GEV and plots in the following examples show this.
# Two examples that should integrate to "unity" given default parameters.
layout(matrix(c(1,2), 2, 2, byrow = TRUE), respect = TRUE)
check.pdf(pdfgev,gev,plot=TRUE)
check.pdf(pdfwei,wei,plot=TRUE)



