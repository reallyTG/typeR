library(MetaheuristicFPA)


### Name: fpa_optim
### Title: Metaheuristic - Flower Pollination Algorithm
### Aliases: fpa_optim

### ** Examples


# find the x-value that gives the minimum of the dejong benchmark function
# y = sum(x[i]^2), i=1:n, -5.12 <= x[i] <= 5.12

# global minimum is 0 when each x = 0
deJong<-function(x){
  deJong = sum(x^2)
}


# run a simulation using the standard flower pollination algorithm
set.seed(1024)  # for reproducive results
library(MetaheuristicFPA)
fpa_opt <- fpa_optim(N = 25, p =0.8 , beta = 1.5, eta = 0.1,
                 maxiter=5000, randEta=FALSE, gloMin=0, objfit=1e-7,
                 D=4, Lower = -5.12, Upper = 5.12, FUN = deJong)
x <- fpa_opt$best_solution




