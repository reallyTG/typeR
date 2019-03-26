library(survivalsvm)


### Name: survivalsvm
### Title: survivalsvm
### Aliases: survivalsvm

### ** Examples

survivalsvm(Surv(time, status) ~ ., veteran, gamma.mu = 0.1)

survsvm.reg <- survivalsvm(formula = Surv(diagtime, status) ~ ., data = veteran,
                           type = "regression", gamma.mu = 0.1,
                           opt.meth = "ipop", kernel = "add_kernel")
                            
survsvm.vb2 <- survivalsvm(data = veteran, time.variable.name = "diagtime",
                           status.variable.name = "status", 
                           type = "vanbelle2", gamma.mu = 0.1,
                           opt.meth = "quadprog", diff.meth = "makediff3", 
                           kernel = "lin_kernel",
                           sgf.sv = 5, sigf = 7, maxiter = 20, 
                           margin = 0.05, bound = 10)
                            



