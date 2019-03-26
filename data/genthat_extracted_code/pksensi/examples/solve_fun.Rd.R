library(pksensi)


### Name: solve_fun
### Title: Solve PK Model Through deSolve Package or Analytical Function
### Aliases: solve_fun

### ** Examples

  q <- "qunif"
  q.arg <- list(list(min = 0.6, max = 1.0),
   list(min = 0.5, max = 1.5),
   list(min = 0.02, max = 0.3),
   list(min = 20, max = 60))

  params <- c("F","KA","KE","V")

  set.seed(1234)
  x <- rfast99(params = params, n = 200, q = q, q.arg = q.arg, rep = 20)

  time <- seq(from = 0.25, to = 12.25, by = 0.5)
  y <- solve_fun(x, model = FFPK, time = time, vars = "output")

  pksim(y) # Visualize uncertainty of model output




