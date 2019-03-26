library(blockmodeling)


### Name: sedist
### Title: Computes distances in terms of Structural equivalence (Lorrain &
###   White, 1971)
### Aliases: sedist
### Keywords: cluster graphs

### ** Examples

# Generating a simple network corresponding to the simple Sum of squares
# Structural equivalence with blockmodel:
# null com
# null null
n <- 20
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(5, 15))
tclu <- table(clu)
net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)

D <- sedist(M = net)
plot.mat(net, clu = cutree(hclust(d = D, method = "ward"), k = 2))



