library(NMOF)


### Name: TA.info
### Title: Threshold-Accepting Information
### Aliases: TA.info

### ** Examples

### MINIMAL EXAMPLE for TAopt

## objective function evaluates to a constant
fun <- function(x)
    0

## neighbourhood function does not even change the solution,
## but it reports information
nb <- function(x) {
    tmp <- TA.info()
    cat("current threshold ",   tmp$threshold,
        "| current step ",      tmp$step,
        "| current iteration ", tmp$iteration, "\n")
    x
}

## run TA
algo <- list(nS = 5,
             nT = 2,
             nD = 3,
             x0 = rep(0, 5),
             neighbour = nb,
             printBar = FALSE,
             printDetail = FALSE)
ignore <- TAopt(fun, algo)

## printed output:
##    current threshold  NA | current step  1 | current iteration  NA 
##    current threshold  NA | current step  2 | current iteration  NA 
##    current threshold  NA | current step  3 | current iteration  NA 
##    current threshold   1 | current step  1 | current iteration  1 
##    current threshold   1 | current step  2 | current iteration  2 
##    current threshold   1 | current step  3 | current iteration  3 
##    current threshold   1 | current step  4 | current iteration  4 
##    current threshold   1 | current step  5 | current iteration  5 
##    current threshold   2 | current step  1 | current iteration  6 
##    current threshold   2 | current step  2 | current iteration  7 
##    current threshold   2 | current step  3 | current iteration  8 
##    current threshold   2 | current step  4 | current iteration  9 
##    current threshold   2 | current step  5 | current iteration  10 




