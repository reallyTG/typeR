library(TSP)


### Name: solve_TSP
### Title: TSP solver interface
### Aliases: solve_TSP solve_TSP.TSP solve_TSP.ATSP
### Keywords: optimize

### ** Examples

## solve a simple Euclidean TSP (using the default method)
etsp <- ETSP(data.frame(x = runif(20), y = runif(20)))
tour <- solve_TSP(etsp)
tour
tour_length(tour)
plot(etsp, tour)


## compare methods
data("USCA50")
USCA50
methods <- c("identity", "random", "nearest_insertion",
  "cheapest_insertion", "farthest_insertion", "arbitrary_insertion",
  "nn", "repetitive_nn", "two_opt")

## calculate tours
tours <- lapply(methods, FUN = function(m) solve_TSP(USCA50, method = m))
names(tours) <- methods

## use the external solver which has to be installed separately
## Not run: 
##D tours$concorde  <- solve_TSP(USCA50, method = "concorde")
##D tours$linkern  <- solve_TSP(USCA50, method = "linkern")
## End(Not run)

## register a parallel backend to perform repetitions in parallel
## Not run: 
##D library(doParallel)
##D registerDoParallel()
## End(Not run)

## add some tours using repetition and two_opt refinements
tours$'nn+two_opt' <- solve_TSP(USCA50, method="nn", two_opt=TRUE)
tours$'nn+rep_10' <- solve_TSP(USCA50, method="nn", rep=10)
tours$'nn+two_opt+rep_10' <- solve_TSP(USCA50, method="nn", two_opt=TRUE, rep=10)
tours$'arbitrary_insertion+two_opt' <- solve_TSP(USCA50)

## show first tour
tours[[1]]

## compare tour lengths
opt <- 14497 # obtained by Concorde
tour_lengths <- c(sort(sapply(tours, tour_length), decreasing = TRUE),
  optimal = opt)
dotchart(tour_lengths/opt*100-100, xlab = "percent excess over optimum")



