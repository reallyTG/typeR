library(mize)


### Name: mize_step
### Title: One Step of Optimization
### Aliases: mize_step

### ** Examples

rosenbrock_fg <- list(
  fn = function(x) {
    100 * (x[2] - x[1] * x[1]) ^ 2 + (1 - x[1]) ^ 2
  },
  gr = function(x) {
    c(
     -400 * x[1] * (x[2] - x[1] * x[1]) - 2 * (1 - x[1]),
      200 *        (x[2] - x[1] * x[1]))
 })
 rb0 <- c(-1.2, 1)

 opt <- make_mize(method = "SD", line_search = "const", step0 = 0.0001,
                  par = rb0, fg = rosenbrock_fg)
 par <- rb0
 for (iter in 1:3) {
   res <- mize_step(opt, par, rosenbrock_fg)
   par <- res$par
   opt <- res$opt
 }



