library(PLMIX)


### Name: Loglikelihood
### Title: Likelihood and Log-likelihood evaluation for a mixture of
###   Plackett-Luce models
### Aliases: Loglikelihood likPLMIX loglikPLMIX loglikelihood Likelihood
###   likelihood loglikPLMIX

### ** Examples


data(d_apa)

K <- ncol(d_apa)
G <- 3
support_par <- matrix(1:(G*K), nrow=G, ncol=K)
weights_par <- c(0.50, 0.25, 0.25)

loglikPLMIX(p=support_par, ref_order=matrix(1:K, nrow=G, ncol=K, byrow=TRUE), 
            weights=weights_par, pi_inv=d_apa)




