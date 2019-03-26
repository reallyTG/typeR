library(analytics)


### Name: rowmean
### Title: Give Column Means of a Matrix-like Object, Based on a Grouping
###   Variable
### Aliases: rowmean

### ** Examples


A <- matrix(1:8, ncol = 2)
rownames(A) <- c("A", "B", "A", "B")
rowmean(A)

B <- matrix(1:40, ncol = 2)
gr <- rep(1:5, 4)
B.mean <- rowmean(B, group = gr)
sum(B.mean[, 1])*4 == sum(B[, 1]) #basic sanity check
sum(B.mean[, 2])*4 == sum(B[, 2]) #basic sanity check

dfB <- as.data.frame(B)
gr <- rep(1:5, 4)
dfB.mean <- rowmean(dfB, group = gr)

numbers <- rnorm(1e7, mean = 3)
C <- matrix(numbers, ncol = 5)
gr <- rep(1:20, 1e5)
rowmean(C, group = gr) # Handles Big Data fast

vec <- 1:10
gr <- rep(1:2, 5)
rowmean(vec, gr)

onegroup = matrix(1:40, ncol = 2)
gr = rep(1,20)
rowmean(onegroup, gr)[1] == mean(onegroup[,1])
rowmean(onegroup, gr)[2] == mean(onegroup[,2])

numbers <- rnorm(30, mean = 3)
D <- matrix(numbers, ncol = 3)
num_blocks <- 2
gr <- rep(1:5, num_blocks)
rownames(D) <- gr
rowmean(D, w = c(0.1,0.9))
rowmean(D, w = c(0,1))
rowmean(D, w = c(0.5,0.5))
rowmean(D)




