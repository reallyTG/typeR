library(BayesFM)


### Name: post.sign.switch
### Title: Perform sign switchting on posterior MCMC sample
### Aliases: post.sign.switch

### ** Examples

set.seed(6)
Y <- simul.dedic.facmod(N = 200, dedic = rep(1:3, each = 5))
mcmc <- befa(Y, Kmax = 5, iter = 1000)
mcmc <- post.column.switch(mcmc)

# factor loadings corresponding to variables 1, 6, 11, 12 and 13 are
# used as benchmarks:
mcmc1 <- post.sign.switch(mcmc, benchmark = c(1, 6, 11, 12, 13))

# factor loadings with the highest posterior probability of being different
# from zero in each column are used as benchmark:
mcmc2 <- post.sign.switch(mcmc)




