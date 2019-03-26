library(optimization)


### Name: optim_sa
### Title: Flexible Optimization with Simulated Annealing
### Aliases: optim_sa

### ** Examples

##### Rosenbrock function
# minimum at f(1,1) = 0
ro <- function(x){
  100*(x[2]-x[1]^2)^2+(1-x[1])^2
}

# Random start values. Example arguments for the relatively simple Rosenbrock function.
ro_sa <- optim_sa(fun = ro,
                  start = c(runif(2, min = -1, max = 1)),
                  lower = c(-5, -5),
                  upper = c(5, 5),
                  trace = TRUE,
                  control = list(t0 = 100,
                            nlimit = 550,
                            t_min = 0.1,
                            dyn_rf = FALSE,
                            rf = 1,
                            r = 0.7
                  )
         )


# Visual inspection.
plot(ro_sa)
plot(ro_sa, type = "contour")


##### Holder table function

# 4 minima at
  #f(8.055, 9.665) = -19.2085
  #f(-8.055, 9.665) = -19.2085
  #f(8.055, -9.665) = -19.2085
  #f(-8.055, -9.665) = -19.2085

ho <- function(x){
  x1 <- x[1]
  x2 <- x[2]

  fact1 <- sin(x1) * cos(x2)
  fact2 <- exp(abs(1 - sqrt(x1^2 + x2^2) / pi))
  y <- -abs(fact1 * fact2)
}

# Random start values. Example arguments for the relatively complex Holder table function.
optim_sa(fun = ho,
         start = c(1, 1),
         lower = c(-10, -10),
         upper = c(10, 10),
         trace = TRUE,
         control = list(dyn_rf = FALSE,
                        rf = 1.6,
                        t0 = 10,
                        nlimit = 200,
                        r = 0.6,
                        t_min = 0.1
         )
)

#### Himmelblau's function
# 4 minima at
  # f(3, 2) = 0
  # f(-2.804, -3.131) = 0
  # f(-3.779, -3.283) = 0
  # f( 3.584, -1.848) = 0

hi <- function(x){
  (x[1]**2 + x[2] - 11)**2 + (x[1] + x[2]**2 -7)**2
}

# Random start values. Example arguments for integer programming.
# Only the integer solution will be found.

var_func_int <- function(para_0, fun_length, rf, temp = NA){
  ret_var_func <- para_0 + sample.int(rf, fun_length, replace = TRUE) *
  ((rbinom(fun_length, 1, 0.5) * -2) + 1)
  return (ret_var_func)
}

optim_sa(fun = hi,
         start = round(c(runif(2, min = -1, max = 1))),
                trace = TRUE,
                lower = c(-4, -4),
                upper=c(4, 4),
                control = list(t0 = 1000,
                               nlimit = 1500,
                               r = 0.8,
                               vf = var_func_int,
                               rf = 3
                )
)



