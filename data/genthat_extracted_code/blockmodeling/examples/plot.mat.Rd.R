library(blockmodeling)


### Name: plot.mat
### Title: Functions for plotting a partitioned matrix (representing the
###   network)
### Aliases: plot.mat plotMat plotMatNm plot.array plotArray plot.crit.fun
###   plot.opt.par plot.opt.par.mode plot.opt.more.par
###   plot.opt.more.par.mode
### Keywords: graphs hplot

### ** Examples

# Generation of the network
n <- 20
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(5, 15))
tclu <- table(clu)
net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)

# Ploting the network
plotMat(M = net, clu = clu, print.digits.cells = 3)
class(net) <- "mat"
plot(net, clu = clu)
# See corresponding functions for examples for other ploting
# functions
# presented, that are essentially only the wrappers for "plot.max"



