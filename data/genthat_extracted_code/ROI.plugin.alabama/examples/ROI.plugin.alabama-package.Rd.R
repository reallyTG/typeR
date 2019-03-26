library(ROI.plugin.alabama)


### Name: control
### Title: alabama
### Aliases: control-parameters

### ** Examples

library(ROI)

n <- 2L
x <- OP(F_objective(sum, n = n), 
        bounds = V_bound(nobj = 2, ld = -1, ud = 1))

control_optim <- list(trace = 0, fnscale = 1, parscale = rep.int(1, n), 
                      ndeps = rep.int(0.001, n), maxit = 100L, abstol = -Inf, 
                      reltol = sqrt(.Machine$double.eps), alpha = 1, 
                      beta = 0.5, gamma = 2, REPORT = 10, type = 1, lmm = 5,
                      factr = 1e+07, pgtol = 0, tmax = 10, temp = 10)

control <- list(start = c(0, 0), method = "BFGS", lam0 = 10, sig0 = 100,  
                tol = 1e-07, max_iter = 50, verbose = FALSE, NMinit = FALSE, 
                ilack.max = 6, i.scale = 1, e.scale = 1, kkt2.check = TRUE,
                control.optim = control_optim)

s <- ROI_solve(x, solver = "alabama", control)



