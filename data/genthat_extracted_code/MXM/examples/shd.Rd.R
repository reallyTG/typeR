library(MXM)


### Name: Structural Hamming distance between two partially oriented DAGs
### Title: Structural Hamming distance between two partially oriented DAGs
### Aliases: shd
### Keywords: Structurall Haming distance distance between DAGs

### ** Examples

y <- rdag(1000, 20, 0.2)
tru <- y$G 
mod <- pc.skel(y$x)
a <- pc.or(mod)
shd( a$G, dag2eg(tru) )



