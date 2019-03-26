library(MXM)


### Name: Graph of unconditional associations
### Title: Graph of unconditional associations
### Aliases: corgraph

### ** Examples

# simulate a dataset with continuous data
y <- rdag2(500, p = 20, nei = 3)
x <- y$x
a <- mmhc.skel(x, max_k = 5, threshold = 0.01, test = "testIndFisher" ) 
b <- pc.skel( x, alpha = 0.01 ) 
d <- corgraph(x, test = "testIndFisher", threshold = 0.01) 



