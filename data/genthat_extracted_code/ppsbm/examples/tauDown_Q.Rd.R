library(ppsbm)


### Name: tauDown_Q
### Title: Construct initial tau from Q+1
### Aliases: tauDown_Q

### ** Examples

# Generate first initial tau for generated_Q3 data

n <- 50
Dmax <- 2^3
Q <- 3
d_part <- 1 # less than 3 (owing to Dmax)
n_perturb <- 2
perc_perturb <- 0.2
n_random <- 1
directed <- FALSE

data <- list(Nijk = statistics(generated_Q3$data, n, Dmax, directed = FALSE))

tau <- tauInitial(data,n,Q,d_part,n_perturb,perc_perturb,n_random,directed)

tau.list <- tauDown_Q(tau[[1]],1)




