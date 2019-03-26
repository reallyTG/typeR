library(mixtools)


### Name: plot.mixMCMC
### Title: Various Plots Pertaining to Mixture Model Output Using MCMC
###   Methods
### Aliases: plot.mixMCMC
### Keywords: file

### ** Examples
 
## M-H algorithm for NOdata with acceptance rate about 40%.

data(NOdata)
attach(NOdata)
set.seed(100)
beta <- matrix(c(1.3, -0.1, 0.6, 0.1), 2, 2)
sigma <- c(.02, .05)
MH.out <- regmixMH(Equivalence, NO, beta = beta, s = sigma, 
                   sampsize = 2500, omega = .0013)
plot(MH.out, summary.plots = TRUE, burnin = 2450, 
     alpha = 0.01)



