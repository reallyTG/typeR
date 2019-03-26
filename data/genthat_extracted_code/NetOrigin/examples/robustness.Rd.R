library(NetOrigin)


### Name: robustness
### Title: run robustness analysis for a source estimate by subsampling
###   individual events.
### Aliases: robustness

### ** Examples

# generate random delay data
data(ptnAth)
require(igraph)
dat <- data.frame(node  = sample(size = 500, make.names(V(ptnAth)$name), replace = TRUE),
                  time  = sample(size = 500, 1:10, replace = TRUE),
                  delay = rexp(500, rate=10))
# compute effective distance
net <- igraph::as_adjacency_matrix(ptnAth, sparse=FALSE)
p <- net/rowSums(net)
eff <- eff_dist(p)
colnames(eff) <- paste('x.',colnames(eff),sep='')

# run robustness analysis
r5 <- robustness(x=dat, type='edm', prop=0.5, n=10, distance=eff)
summary(r5)
plot(r5)

# compare results
r9 <- robustness(x=dat, type='edm', prop=0.9, n=10, distance=eff)
plot(r9, add=TRUE, col='gray')




