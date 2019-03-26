library(pksensi)


### Name: check
### Title: Check the Parameter Sensitivity
### Aliases: check heat_check plot.rfast99 print.rfast99

### ** Examples

q <- "qunif"
q.arg <- list(list(min = 0.6, max = 1),
  list(min = 0.5, max = 1.5),
  list(min = 0.02, max = 0.3),
  list(min = 20, max = 60))

params <- c("F","KA","KE","V")

set.seed(1234)
x <- rfast99(params = params, n = 200, q = q, q.arg = q.arg, rep = 20)

time <- seq(from = 0.25, to = 12.25, by = 0.5)
y <- solve_fun(x, model = FFPK, time = time, vars = "output")


tell2(x,y) # Link decoupling simulation result
x

# Check results of sensitivity measures
check(x)
plot(x)
heat_check(x)
heat_check(x, index = "CI")




