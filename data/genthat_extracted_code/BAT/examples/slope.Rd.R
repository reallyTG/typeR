library(BAT)


### Name: slope
### Title: Slope of accumulation curves.
### Aliases: slope

### ** Examples

comm1 <- matrix(c(2,2,0,0,0,1,1,0,0,0,0,2,2,0,0,0,0,0,2,2), nrow = 4, ncol = 5, byrow = TRUE)
comm2 <- matrix(c(1,1,0,0,0,0,2,1,0,0,0,0,2,1,0,0,0,0,2,1), nrow = 4, ncol = 5, byrow = TRUE)
tree <- hclust(dist(c(1:5), method="euclidean"), method="average")
acc.alpha = alpha.accum(comm1)
slope(acc.alpha)
acc.beta = beta.accum(comm1, comm2, tree)
slope(acc.beta)



