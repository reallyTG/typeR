library(BayesFM)


### Name: summary.befa
### Title: Summarize 'befa' object
### Aliases: summary.befa

### ** Examples

set.seed(6)

# generate fake data with 15 manifest variables and 3 factors
Y <- simul.dedic.facmod(N = 200, dedic = rep(1:3, each = 5))

# run MCMC sampler and post process output
# notice: 1000 MCMC iterations for illustration purposes only,
#  increase this number to obtain reliable posterior results!
mcmc <- befa(Y, Kmax = 5, iter = 1000)
mcmc <- post.column.switch(mcmc)
mcmc <- post.sign.switch(mcmc)

# summarize posterior results
summary(mcmc)

# summarize highest posterior probability (HPP) model
hppm.sum <- summary(mcmc, what = 'hppm')

# print summary with 6-digit precision
print(hppm.sum, digits = 6)

# extract posterior means of the factor loadings in HPP model
alpha.mean <- hppm.sum$alpha$m1$mean
print(alpha.mean)




