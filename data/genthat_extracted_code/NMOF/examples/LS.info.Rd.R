library(NMOF)


### Name: LS.info
### Title: Local-Search Information
### Aliases: LS.info

### ** Examples

## MINIMAL EXAMPLE for LSopt

## objective function evaluates to a constant
fun <- function(x)
    0

## neighbourhood function does not even change the solution,
## but it reports information
nb <- function(x) {
    tmp <- LS.info()
    cat("current iteration ", tmp$iteration, "\n")
    x
}

## run LS
algo <- list(nS = 5,
             x0 = rep(0, 5),
             neighbour = nb,
             printBar = FALSE)
ignore <- LSopt(fun, algo)




