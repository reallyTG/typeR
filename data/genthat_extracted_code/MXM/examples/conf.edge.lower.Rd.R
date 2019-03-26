library(MXM)


### Name: Lower limit of the confidence of an edge
### Title: Lower limit of the confidence of an edge
### Aliases: conf.edge.lower

### ** Examples

y <- rdag2(200, p = 40, nei = 3)
x <- y$x
g <- pc.skel.boot(x, R = 199)$Gboot
a <- g[ lower.tri(g) ]
conf.edge.lower(a)



