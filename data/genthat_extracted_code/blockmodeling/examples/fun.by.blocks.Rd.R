library(blockmodeling)


### Name: fun.by.blocks
### Title: Computation of function values by blocks
### Aliases: fun.by.blocks fun.by.blocks.default fun.by.blocks.mat
###   fun.by.blocks.opt.more.par
### Keywords: cluster math

### ** Examples

n <- 8 # If larger, the number of partitions increases dramatically,
# as does if we increase the number of clusters
net <- matrix(NA, ncol = n, nrow = n)
clu <- rep(1:2, times = c(3, 5))
tclu <- table(clu)
net[clu == 1, clu == 1] <- rnorm(n = tclu[1] * tclu[1], mean = 0, sd = 1)
net[clu == 1, clu == 2] <- rnorm(n = tclu[1] * tclu[2], mean = 4, sd = 1)
net[clu == 2, clu == 1] <- rnorm(n = tclu[2] * tclu[1], mean = 0, sd = 1)
net[clu == 2, clu == 2] <- rnorm(n = tclu[2] * tclu[2], mean = 0, sd = 1)

# Optimizing 10 random partitions with optRandomParC
res <- optRandomParC(M = net, k = 2, rep = 10, approaches = "hom", homFun = "ss", blocks = "com")
plot(res) # Hopefully we get the original partition
fun.by.blocks(res)
# Computing mean by blocks, ignoring the diagonal (default)



