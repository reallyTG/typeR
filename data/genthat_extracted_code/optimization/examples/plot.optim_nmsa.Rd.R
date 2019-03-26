library(optimization)


### Name: plot.optim_nmsa
### Title: Plot an optim_nmsa Object
### Aliases: plot.optim_nmsa

### ** Examples

# S3 method for class 'optim_nlme'

# Himmelblau's function
hi <- function(x){(x[1]**2 + x[2] - 11)**2 + (x[1] + x[2]**2 -7)**2}

out_nm <- optim_nm(hi, k = 2, trace = TRUE)
out_sa <- optim_sa(fun = hi, start = c(runif(2, min = -1, max = 1)),
                   trace = TRUE, lower = c(-4, -4) ,upper=c(4, 4),
                   control = list(t0 = 1000, nlimit = 1500,r = 0.8))

# Examples for optimization results via 'Nelder-Mead' method.
plot(out_nm)
plot(out_nm, type = "contour", lower = c(-4, -4), upper = c(4, 4))

# Examples for optimization results via 'Simulated Annealing' method.
plot(out_sa)
plot(out_sa, type = "contour")



