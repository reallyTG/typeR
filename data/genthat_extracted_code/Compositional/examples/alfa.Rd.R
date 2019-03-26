library(Compositional)


### Name: The alpha-transformation
### Title: The alpha-transformation
### Aliases: alfa alef
### Keywords: \alpha -transformation

### ** Examples

library(MASS)
x <- as.matrix(fgl[, 2:9])
x <- x / rowSums(x)
y1 <- alfa(x, 0.2)$aff
y2 <- alfa(x, 1)$aff
rbind( colMeans(y1), colMeans(y2) )
y3 <- alfa(x, 0.2)$aff
dim(y1)  ;  dim(y3)
rowSums(y1)
rowSums(y3)



