library(kutils)


### Name: is.data.frame.simple
### Title: Check if a data frame is a simple collection of columns (no
###   lists or matrices within)
### Aliases: is.data.frame.simple

### ** Examples

N <- 100
mydf <- data.frame(x5 = rnorm(N),
                   x4 = rpois(N, lambda = 3),
                   x3 = ordered(sample(c("lo", "med", "hi"),
                   size = N, replace=TRUE)))
is.data.frame.simple(mydf)
mydf$amatr <- matrix(0, ncol = 2, nrow = NROW(mydf))
is.data.frame.simple(mydf)
mydf$amatr <- NULL
is.data.frame.simple(mydf)
mydf$adf <- mydf
is.data.frame.simple(mydf)



