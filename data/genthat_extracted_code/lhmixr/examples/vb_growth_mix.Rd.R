library(lhmixr)


### Name: vb_growth_mix
### Title: Fit finite mixture von Bertalanffy growth model.
### Aliases: vb_growth_mix

### ** Examples

set.seed(1010)
sim.dat <- sim_vb_data(nfemale = 50, nmale = 50, mean_ageF = 4, mean_ageM = 4,
                      growth_parF = c(linf = 30, k = 0.5, t0 = -1, sigma = 0.1),
                      growth_parM = c(linf = 25, k = 0.5, t0 = -1, sigma = 0.1),
                      mat_parF = c(A50 = 5, MR = 2), mat_parM = c(A50 = 3, MR = 2),
                      distribution = "lognormal")

## Model fit with contrained Brody's growth coefficient
## Set up the constraint
binding <- matrix(c(1:2, rep(3, 2), 4:7), ncol = 2, byrow = TRUE)
rownames(binding) <- c("lnlinf", "lnk", "lnnt0", "lnsigma")
colnames(binding) <- c("female", "male")
## note: lnnt0 is the natural logarithm of the negative of t0 (t0 < 0)
## starting values 
start.par <- c(c(log(30), log(25)), rep(log(0.3), 1), rep(log(1), 2), rep(log(.1), 2))
start.list <- list(par = list(mixprop = 0.5, growth.par = start.par))
vb.bind.fit <- vb_growth_mix(data = sim.dat, start.list = start.list,
                             binding = binding, distribution = "lognormal",
                             reltol = 1e-6)




