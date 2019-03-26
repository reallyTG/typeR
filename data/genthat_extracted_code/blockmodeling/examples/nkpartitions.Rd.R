library(blockmodeling)


### Name: nkpartitions
### Title: Functions for listing all possible partitions or just counting
###   the number of them
### Aliases: nkpartitions nkpar
### Keywords: cluster

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

# Computation of criterion function with the correct partition
nkpar(n = n, k = length(tclu)) # Computing the number of partitions
all.par <- nkpartitions(n = n, k = length(tclu)) # Forming the partitions
all.par <- lapply(apply(all.par, 1, list), function(x) x[[1]])
# to make a list out of the matrix
res <- critFunC(M = net, clu = clu, approaches = "val", 
blocks = c("nul", "com"), preSpecM = 4)
plot(res) # We get the original partition



