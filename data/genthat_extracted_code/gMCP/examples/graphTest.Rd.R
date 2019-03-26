library(gMCP)


### Name: graphTest
### Title: Multiple testing using graphs
### Aliases: graphTest
### Keywords: htest

### ** Examples



#### example from Bretz et al. (2010)
weights <- c(1/3, 1/3, 1/3, 0, 0, 0)
graph <- rbind(c(0,       0.5, 0,     0.5, 0,      0),
               c(1/3,     0,   1/3,    0,   1/3,    0),
               c(0,       0.5, 0,     0,   0,      0.5),
               c(0,       1,   0,     0,   0,      0),
               c(0.5,     0,   0.5,   0,   0,      0),
               c(0,       1,   0,     0,   0,      0))
pvals <- c(0.1, 0.008, 0.005, 0.15, 0.04, 0.006)
graphTest(pvals, weights, alpha=0.025, graph)

## observe graphical procedure in detail
graphTest(pvals, weights, alpha=0.025, graph, verbose = TRUE)

## now use many p-values (useful for power simulations)
pvals <- matrix(rbeta(6e4, 1, 30), ncol = 6)
out <- graphTest(pvals, weights, alpha=0.025, graph)
head(out)

## example using multiple graphs (instead of 1)
G1 <- rbind(c(0,0.5,0.5,0,0), c(0,0,1,0,0),
            c(0, 0, 0, 1-0.01, 0.01), c(0, 1, 0, 0, 0),
            c(0, 0, 0, 0, 0))
G2 <- rbind(c(0,0,1,0,0), c(0.5,0,0.5,0,0),
            c(0, 0, 0, 0.01, 1-0.01), c(0, 0, 0, 0, 0),
            c(1, 0, 0, 0, 0))
weights <- rbind(c(1, 0, 0, 0, 0), c(0, 1, 0, 0, 0))
pvals <- c(0.012, 0.025, 0.005, 0.0015, 0.0045)
out <- graphTest(pvals, weights, alpha=c(0.0125, 0.0125), G=list(G1, G2), verbose = TRUE)

## now again with many p-values
pvals <- matrix(rbeta(5e4, 1, 30), ncol = 5)
out <- graphTest(pvals, weights, alpha=c(0.0125, 0.0125), G=list(G1, G2))
head(out)




