library(ExpDE)


### Name: ExpDE
### Title: Experimental Differential Evolution - ExpDE
### Aliases: ExpDE

### ** Examples

# DE/rand/1/bin with population 40, F = 0.8 and CR = 0.5
popsize  <- 100
mutpars  <- list(name = "mutation_rand", f = 0.8)
recpars  <- list(name = "recombination_bin", cr = 0.5, minchange = TRUE)
selpars  <- list(name = "selection_standard")
stopcrit <- list(names = "stop_maxiter", maxiter = 100)
probpars <- list(name  = "sphere",
                xmin = rep(-5.12,10), xmax = rep(5.12,10))
seed <- NULL
showpars <- list(show.iters = "numbers", showevery = 1)
ExpDE(popsize, mutpars, recpars, selpars, stopcrit, probpars, seed, showpars)


# DE/wgi/1/blxAlpha
recpars  <- list(name = "recombination_blxAlphaBeta", alpha = 0.1, beta = 0.1)
mutpars  <- list(name = "mutation_wgi", f = 0.8)
ExpDE(popsize, mutpars, recpars, selpars, stopcrit, probpars)

# DE/best/1/sbx
recpars  <- list(name = "recombination_sbx", eta = 10)
mutpars  <- list(name = "mutation_best", f = 0.6, nvecs = 1)
ExpDE(popsize, mutpars, recpars, selpars, stopcrit, probpars)

# DE/best/1/eigen/bin
recpars  <- list(name = "recombination_eigen", 
                 othername = "recombination_bin", 
                 cr = 0.5, minchange = TRUE)
showpars <- list(show.iters = "dots", showevery = 10)
stopcrit <- list(names = "stop_maxeval", maxevals = 10000)
ExpDE(popsize, mutpars, recpars, selpars, stopcrit, probpars, seed = 1234)




