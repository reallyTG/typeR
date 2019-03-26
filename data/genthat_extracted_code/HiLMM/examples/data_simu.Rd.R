library(HiLMM)


### Name: data_simu
### Title: function to generate a dataset which is compatible with the
###   arguments of the function HiLMM
### Aliases: data_simu

### ** Examples

library(HiLMM)
data_sim=data_simu(100,1000,0.5,0.5)
 Y=data_sim$Y
 W=data_sim$W
## The function is currently defined as
function (n, N, eta_star, q) 
{
    sigma_u = 1
    P = runif(N, 0.1, 0.5)
    W = matrix(0, n, N)
    for (j in 1:N) {
        W[, j] = rbinom(n, 2, P[j])
    }
    nb_comp_non_zero = q * N
    sigma_e = sqrt(q * N * sigma_u^2 * (1 - eta_star)/eta_star)
    b = sample(1:N, nb_comp_non_zero)
    a1 = sort(b)
    u = rnorm(nb_comp_non_zero, 0, sigma_u)
    e = rnorm(n, 0, sigma_e)
    U = matrix(0, N)
    U[a1] = u
    Z = scale(W, center = TRUE, scale = TRUE)
    Y = Z %*% U + e
    list(Z = Z, Y = Y)
  }



