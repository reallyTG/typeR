library(mefa4)


### Name: Melt
### Title: Melting Matrices
### Aliases: Melt
### Keywords: manip

### ** Examples

xx <- data.frame(
    sample = paste("Sample", c(1,1,2,2,3,4), sep="."),
    species = c(paste("Species", c(1,1,1,2,3), sep="."),  "zero.pseudo"),
    count = c(1,2,10,3,4,0),
    segment = letters[c(6,13,6,13,6,6)])
xx
xx0 <- Xtab(count ~ sample + species, xx)
xx1 <- Xtab(count ~ sample + species + segment, xx)
(M1 <- Melt(xx0))
Melt(as.matrix(xx0))
(M2 <- Melt(xx1))
stopifnot(identical(Xtab(value ~ rows + cols, M1), xx0))
stopifnot(identical(Xtab(value ~ rows + cols + segm, M2), xx1))



