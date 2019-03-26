library(BayesFM)


### Name: post.column.switch
### Title: Perform column switchting on posterior MCMC sample
### Aliases: post.column.switch

### ** Examples

set.seed(6)
Y <- simul.dedic.facmod(N = 200, dedic = rep(1:3, each = 5))
mcmc <- befa(Y, Kmax = 5, iter = 1000)
mcmc <- post.column.switch(mcmc)




