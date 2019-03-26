library(fwsim)


### Name: fwsim
### Title: Fisher-Wright Population Simulation
### Aliases: fwsim fwsim_fixed print.fwsim summary.fwsim plot.fwsim
### Keywords: Fisher-Wright

### ** Examples

# SMM (stepwise mutation model) example
set.seed(1)
fit <- fwsim(G = 100L, H0 = c(0L, 0L, 0L), N0 = 10000L, 
  mutmodel = c(Loc1 = 0.001, Loc2 = 0.002, Loc3 = 0.003))
summary(fit)
fit

# SMM (stepwise mutation model) example
H0 <- matrix(c(0L, 0L, 0L), 1L, 3L, byrow = TRUE)

mutmodel <- init_mutmodel(modeltype = 1L, 
  mutpars = matrix(c(c(0.003, 0.001), rep(0.004, 2), rep(0.001, 2)), 
                   ncol = 3, 
                   dimnames = list(NULL, c("DYS19", "DYS389I", "DYS391"))))
mutmodel

set.seed(1)
fit <- fwsim(G = 100L, H0 = H0, N0 = 10000L, mutmodel = mutmodel)

xtabs(N ~ DYS19 + DYS389I, fit$population)
plot(1L:fit$pars$G, fit$pop_sizes, type = "l", 
  ylim = range(range(fit$pop_sizes), range(fit$expected_pop_sizes)))
points(1L:fit$pars$G, fit$expected_pop_sizes, type = "l", col = "red")

set.seed(1)
fit_fixed <- fwsim_fixed(G = 100L, H0 = H0, N0 = 10000L, mutmodel = mutmodel)

# LMM (logistic mutation model) example
mutpars.locus1 <- c(0.149,   2.08,    18.3,   0.149,   0.374,   27.4) # DYS19
mutpars.locus2 <- c(0.500,   1.18,    18.0,   0.500,   0.0183,  349)  # DYS389I
mutpars.locus3 <- c(0.0163,  17.7,    11.1,   0.0163,  0.592,   14.1) # DYS391
mutpars <- matrix(c(mutpars.locus1, mutpars.locus2, mutpars.locus3), ncol = 3)
colnames(mutpars) <- c("DYS19", "DYS389I", "DYS391")
mutmodel <- init_mutmodel(modeltype = 2L, mutpars = mutpars)
mutmodel

set.seed(1)
H0_LMM <- matrix(c(15L, 13L, 10L), 1L, 3L, byrow = TRUE)
fit_LMM <- fwsim(G = 100L, H0 = H0_LMM, N0 = 10000L, mutmodel = mutmodel)
xtabs(N ~ DYS19 + DYS389I, fit_LMM$population)



