library(PLMIX)


### Name: rPLMIX
### Title: Random sample from a mixture of Plackett-Luce models
### Aliases: rPLMIX

### ** Examples


K <- 6
G <- 3
support_par <- matrix(1:(G*K), nrow=G, ncol=K)
weights_par <- c(0.50, 0.25, 0.25)

set.seed(47201)
simulated_data <- rPLMIX(n=5, K=K, G=G, p=support_par, weights=weights_par)
simulated_data$comp
simulated_data$sim_data




