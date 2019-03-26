library(libstableR)


### Name: stable_pdf_and_cdf
### Title: PDF and CDF of a skew stable distribution.
### Aliases: stable_pdf_and_cdf stable_pdf stable_cdf
### Keywords: distribution

### ** Examples

pars <- c(1.5, 0.9, 1, 0)
x <- seq(-5, 10, 0.001)

pdf <- stable_pdf(x, pars)
cdf <- stable_cdf(x, pars)

plot(x, pdf, type = "l")



