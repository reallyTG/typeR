library(MOEADr)


### Name: print.moead
### Title: print.moead
### Aliases: print.moead

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
print(out)




