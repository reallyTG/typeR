library(NMOF)


### Name: SA.info
### Title: Simulated-Annealing Information
### Aliases: SA.info

### ** Examples

### MINIMAL EXAMPLE for SAopt

## the objective function evaluates to a constant
fun <- function(x)
    0

## the neighbourhood function does not even change
## the solution; it only reports information
nb <- function(x) {
    info <- SA.info()
    cat("current step ",        info$step,
        "| current iteration ", info$iteration, "\n")
    x
}

## run SA
algo <- list(nS = 5, nT = 2, nD = 10,
             initT = 1,
             x0 = rep(0, 5),
             neighbour = nb,
             printBar = FALSE)
ignore <- SAopt(fun, algo)



