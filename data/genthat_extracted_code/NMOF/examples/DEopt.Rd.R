library(NMOF)


### Name: DEopt
### Title: Optimisation with Differential Evolution
### Aliases: DEopt
### Keywords: optimize

### ** Examples

## Example 1: Trefethen's 100-digit challenge (problem 4)
## http://people.maths.ox.ac.uk/trefethen/hundred.html

OF <- tfTrefethen               ### see ?testFunctions
algo <- list(nP = 50L,          ### population size
             nG = 300L,         ### number of generations
              F = 0.6,          ### step size
             CR = 0.9,          ### prob of crossover
            min = c(-10, -10),  ### range for initial population
            max = c( 10,  10))

sol <- DEopt(OF = OF, algo = algo)
## correct answer: -3.30686864747523
format(sol$OFvalue, digits = 12)
## check convergence of population
sd(sol$popF)
ts.plot(sol$Fmat, xlab = "generations", ylab = "OF")


## Example 2: vectorising the evaluation of the population
OF <- tfRosenbrock     ### see ?testFunctions
size <- 3L             ### define dimension
x <- rep.int(1, size)  ### the known solution ...
OF(x)                  ### ... should give zero

algo <- list(printBar = FALSE,
                   nP = 30L,
                   nG = 300L,
                    F = 0.6,
                   CR = 0.9,
                  min = rep(-100, size),
                  max = rep( 100, size))

## run DEopt
(t1 <- system.time(sol <- DEopt(OF = OF, algo = algo)))
sol$xbest
sol$OFvalue  ### should be zero (with luck)

## a vectorised Rosenbrock function: works only with a *matrix* x
OF2 <- function(x) {
    n <- dim(x)[1L]
    xi <- x[seq_len(n - 1L), ]
    colSums(100 * (x[2L:n, ] - xi * xi)^2 + (1 - xi)^2)
}

## random solutions (every column of 'x' is one solution)
x <- matrix(rnorm(size * algo$nP), size, algo$nP)
all.equal(OF2(x)[1:3],
          c(OF(x[ ,1L]), OF(x[ ,2L]), OF(x[ ,3L])))

## run DEopt and compare computing time
algo$loopOF <- FALSE
(t2 <- system.time(sol2 <- DEopt(OF = OF2, algo = algo)))
sol2$xbest
sol2$OFvalue       ### should be zero (with luck)
t1[[3L]]/t2[[3L]]  ### speedup



