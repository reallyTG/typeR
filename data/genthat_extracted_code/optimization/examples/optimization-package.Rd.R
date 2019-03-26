library(optimization)


### Name: optimization-package
### Title: Flexible Optimization of Complex Loss Functions with State and
###   Parameter Space Constraints
### Aliases: optimization-package

### ** Examples

hi <- function(x){(x[1]**2 + x[2] - 11)**2 + (x[1] + x[2]**2 -7)**2}
optim_nm(fun = hi, k = 2)
optim_sa(fun = hi, start = c(runif(2, min = -1, max = 1)),
  trace = FALSE,
  lower = c(-4, -4),
  upper = c(4, 4),
  control = list(dyn_rf = FALSE,
    rf = 1.2,
    t0 = 10,
    nlimit = 100,
    r = 0.6,
    t_min = 0.1
  )
)



