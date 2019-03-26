library(blockmodeling)


### Name: two2one
### Title: Two-mode network conversions
### Aliases: two2one one2two
### Keywords: cluster graphs

### ** Examples

# Generating a simple network corresponding to the simple Sum of squares
# Structural equivalence with blockmodel:
# null com
# null null
n <- c(7, 13)
net <- matrix(NA, nrow = n[1], ncol = n[2])
clu <- list(rep(1:2, times = c(3, 4)), rep(1:2, times = c(5, 8)))
tclu <- lapply(clu, table)
net[clu[[1]] == 1, clu[[2]] == 1] <- rnorm(n = tclu[[1]][1] * tclu[[2]][1],
   mean = 0, sd = 1)
net[clu[[1]] == 1, clu[[2]] == 2] <- rnorm(n = tclu[[1]][1] * tclu[[2]][2],
   mean = 4, sd = 1)
net[clu[[1]] == 2, clu[[2]] == 1] <- rnorm(n = tclu[[1]][2] * tclu[[2]][1],
   mean = 4, sd = 1)
net[clu[[1]] == 2, clu[[2]] == 2] <- rnorm(n = tclu[[1]][2] * tclu[[2]][2],
   mean = 0, sd = 1)
plot.mat(net, clu = clu) # Two mode matrix of a two mode network

# Converting to one mode network
M1 <- two2one(net)$M
plot.mat(M1, clu = two2one(net)$clu) # Plotting one mode matrix
# Converting one to two mode matrix and plotting
plot.mat(one2two(M1, clu = clu)$M, clu = clu)




