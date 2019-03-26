library(ade4)


### Name: dotcircle
### Title: Representation of n values on a circle
### Aliases: dotcircle
### Keywords: hplot

### ** Examples

w <- scores.neig(neig(n.cir = 24))
par(mfrow = c(4,4))
for (k in 1:16) dotcircle(w[,k],labels = 1:24)
par(mfrow = c(1,1))



