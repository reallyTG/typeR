library(ResourceSelection)


### Name: CAIC
### Title: Consistent AIC
### Aliases: CAIC CAICtable CAIC.default
### Keywords: htest

### ** Examples

## compare some random models
y <- rnorm(10)
a <- lm(y ~ runif(10))
b <- lm(y ~ runif(10))

0.5*(AIC(a) + BIC(a))
CAIC(a)
AIC(a)
CAIC(a, alpha=1)
BIC(a)
CAIC(a, alpha=0)

CAIC(a, b)
CAIC(a, b, alpha=0.2)

CAICtable(a, b, alpha=1)

## you can use global option
## useful when inside of xv or bootstrap
## no need for extra argument
getOption("CAIC_alpha")
op <- options(CAIC_alpha = 0.2)
getOption("CAIC_alpha")
CAIC(a,b)
options(op)
getOption("CAIC_alpha")



