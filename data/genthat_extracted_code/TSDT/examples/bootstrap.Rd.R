library(TSDT)


### Name: bootstrap
### Title: bootstrap
### Aliases: bootstrap

### ** Examples

## Generate example data frame containing response and treatment
N <- 20
x <- data.frame( runif( N ) )
names( x ) <- "response"
x$treatment <- factor( sample( c("Control","Experimental"), size = N,
                       prob = c(0.8,0.2), replace = TRUE ) )

## Generate two bootstrap samples without regard to treatment
ex1 <- bootstrap( x, n_samples = 2 )

## Generate two bootstrap samples stratified by treatment
ex2 <- bootstrap( x, trt = x$treatment, trt_control = "Control", n_samples = 2 )

## For each bootstrap sample compute a statistic on the in-bag and out-of-bag data
ex3 <- bootstrap( x, FUN = mean, varname = "response", n_samples = 2 )

## Specify a user-defined function that takes a numeric vector input and
## returns a numeric result
sort_and_rank <- function( z, rank ){
  z <- sort( z )
  return( z[rank] )
}

ex4 <- bootstrap( x, FUN = sort_and_rank, arglist = list( rank = 1 ),
                  varname = "response", n_samples = 2 )



