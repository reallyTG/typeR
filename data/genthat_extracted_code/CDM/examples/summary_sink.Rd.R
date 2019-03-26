library(CDM)


### Name: summary_sink
### Title: Prints 'summary' and 'sink' Output in a File
### Aliases: summary_sink

### ** Examples

#############################################################################
# EXAMPLE 1: summary_sink example for lm function
#############################################################################

#--- simulate some data
set.seed(997)
N <- 200
x <- stats::rnorm( N )
y <- .4 * x + stats::rnorm(N, sd=.5 )

#--- fit a linear model and sink summary into a file
mod1 <- stats::lm( y ~ x )
summary_sink(mod1, file="my_model")

#--- fit a second model and append it to file
mod2 <- stats::lm( y ~ x + I(x^2) )
summary_sink(mod2, file="my_model", append=TRUE )



