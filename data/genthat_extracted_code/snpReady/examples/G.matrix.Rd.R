library(snpReady)


### Name: G.matrix
### Title: Estimation of Genomic Relationship Matrix
### Aliases: G.matrix

### ** Examples

#(1) Additive and dominance relationship matrix 
data(maize.hyb)
x <- G.matrix(maize.hyb, method = "VanRaden", format = "wide")
A <- x$Ga
D <- x$Gd



