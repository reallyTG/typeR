library(nloptr)


### Name: nloptr.print.options
### Title: Print description of nloptr options
### Aliases: nloptr.print.options
### Keywords: interface optimize

### ** Examples


library('nloptr')
nloptr.print.options()

nloptr.print.options( opts.show = c("algorithm", "check_derivatives") )

opts <- list("algorithm"="NLOPT_LD_LBFGS",
             "xtol_rel"=1.0e-8)
nloptr.print.options( opts.user = opts )




