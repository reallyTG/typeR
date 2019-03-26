library(MOEADr)


### Name: plot.moead
### Title: plot.moead
### Aliases: plot.moead

### ** Examples

problem.1 <- list(name = "example_problem",
                  xmin = rep(-1,30),
                  xmax = rep(1,30),
                  m    = 2)
out <- moead(preset    = preset_moead("original2"),
             problem   = problem.1,
             stopcrit  = list(list(name = "maxiter",
                                   maxiter = 100)),
             showpars  = list(show.iters = "dots",
                              showevery  = 10))
plot(out, suppress.pause = TRUE)




