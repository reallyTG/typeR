library(BayesFM)


### Name: plot.befa
### Title: Plot object of class 'befa'
### Aliases: plot.befa

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

# plot results for highest posterior probability model
plot(mcmc, what = 'hppm')




