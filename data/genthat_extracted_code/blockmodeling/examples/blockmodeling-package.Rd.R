library(blockmodeling)


### Name: blockmodeling-package
### Title: An R package for Generalized and classical blockmodeling of
###   valued networks
### Aliases: blockmodeling-package
### Keywords: package cluster graphs

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

# We select a random partition  and then optimize  it
all.par <- nkpartitions(n = n, k = length(tclu))
# Forming the partitions
all.par <- lapply(apply(all.par, 1, list), function(x) x[[1]])

# Optimizing one partition
res <- optParC(M = net,
   clu = all.par[[sample(1:length(all.par), size = 1)]],
   approaches = "hom", homFun = "ss" , blocks = "com")
plot(res) # Hopefully we get the original partition

# Optimizing 10 random partitions with optRandomParC
res <- optRandomParC(M = net, k = 2, rep = 10, 
approaches = "hom", homFun = "ss", blocks = "com")
plot(res) # Hopefully we get the original partition

# Using indirect approach - structural equivalence
D <- sedist(M = net)
plot.mat(net, clu = cutree(hclust(d = D, method = "ward"), k = 2))



