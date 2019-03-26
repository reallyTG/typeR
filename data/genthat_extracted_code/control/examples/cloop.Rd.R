library(control)


### Name: cloop
### Title: Closed Feedback Loops
### Aliases: cloop

### ** Examples

J <- 2.0; b <- 0.04; K <- 1.0; R <- 0.08; L <- 1e-4
P <- TF("K/(s*((J*s + b)*(L*s + R) + K^2))")
cloop(P)
cloop(ss(1,2,3,4))



