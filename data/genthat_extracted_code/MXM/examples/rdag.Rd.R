library(MXM)


### Name: Data simulation from a DAG
### Title: Simulation of data from DAG (directed acyclic graph)
### Aliases: rdag rdag2 rmdag
### Keywords: Directed acylic graph simulation of random values

### ** Examples

y <- rdag(100, 20, 0.2)
x <- y$x
tru <- y$G 

mod <- pc.con(x)
b <- pc.or(mod)
plotnetwork(tru) 
dev.new()
plotnetwork(b$G)

y <- rmdag(1000, p = 10, nei = 3)
x <- y$x
## make every factor numerical starting from 0.
for (i in 1:dim(x)[2]) {
  if ( is.factor(x[, i]) )  x[, i] <- as.numeric(x[, i]) - 1  
}




