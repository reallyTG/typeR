library(expint)


### Name: gammainc
### Title: Incomplete Gamma Function
### Aliases: gammainc gamma_inc IncompleteGammaFunction
### Keywords: math

### ** Examples

## a > 0
x <- c(0.2, 2.5, 5, 8, 10)
a <- 1.2
gammainc(a, x)
gamma(a) * pgamma(x, a, 1, lower = FALSE) # same

## a = 0
a <- 0
gammainc(a, x)
expint(x)                                 # same

## a < 0
a <- c(-0.25, -1.2, -2)
sapply(a, gammainc, x = x)



