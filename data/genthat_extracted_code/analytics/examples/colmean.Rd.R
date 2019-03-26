library(analytics)


### Name: colmean
### Title: Give Row Means of a Matrix-like Object, Based on a Grouping
###   Variable
### Aliases: colmean

### ** Examples


A <- matrix(1:8, ncol = 4)
colnames(A) <- c("A", "B", "A", "B")
colmean(A)
colmean(A, w = c(0.2,0.8))




