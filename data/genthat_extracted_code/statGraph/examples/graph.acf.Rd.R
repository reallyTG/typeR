library(statGraph)


### Name: graph.acf
### Title: Auto Correlation Function Estimation for Graphs
### Aliases: graph.acf
### Keywords: autocorrelation

### ** Examples

require(igraph)
x <- list()
p <- array(0, 100)
p[1:3] <- rnorm(3)
for (t in 4:100) {
    p[t] <- 0.5*p[t-3] + rnorm(1)
}
ma <- max(p)
mi <- min(p)
p <- (p - mi)/(ma-mi)
for (t in 1:100) {
    x[[t]] <- get.adjacency(erdos.renyi.game(100, p[t]))
}
graph.acf(x, plot=TRUE)




