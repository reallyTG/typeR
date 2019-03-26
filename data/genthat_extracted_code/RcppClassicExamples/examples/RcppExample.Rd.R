library(RcppClassicExamples)


### Name: RcppExample
### Title: Rcpp R / C++ interface example - deprecated API
### Aliases: RcppExample print.RcppExample
### Keywords: programming interface

### ** Examples


params <- list(method='BFGS',
               tolerance=1.0e-8,
               maxIter=1000,
               startDate=as.Date('2006-7-15'))

nlist <- list(ibm = 80.50, hp = 53.64, c = 45.41)

numvec <- seq(1,5) # numerical vector

nummat <- matrix(seq(1,20),4,5) # numerical matrix

stringvec <- c("hello", "world", "fractal") # string vector

datestr <- c('2006-6-10', '2006-7-12', '2006-8-10')
datevec <- as.Date(datestr, "%Y-%m-%d") # date vector

df <- data.frame(a=c(TRUE, TRUE, FALSE), b=I(c('a','b','c')),
c=c('beta', 'beta', 'gamma'), dates=datevec)

fnvec <- function(x) { sum(x) } # Add up components of vector

fnlist <- function(l) { # Return vector with 1 added to each component
  vec <- c(l$alpha + 1, l$beta + 1, l$gamma + 1)
  vec
}

result <- RcppExample(params, nlist, numvec, nummat, df, datevec,
                      stringvec, fnvec, fnlist)

result




