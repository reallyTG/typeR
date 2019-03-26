library(FDboost)


### Name: subset_hmatrix
### Title: Subsets hmatrix according to an index
### Aliases: subset_hmatrix

### ** Examples

t1 <- rep((1:5)/2, each = 3)
id1 <- rep(1:3, 5)
x1 <- matrix(1:15, ncol = 5) 
s1 <- (1:5)/2 
hmat <- hmatrix(time = t1, id = id1, x = x1, argvals = s1, timeLab = "t1", 
                argvalsLab = "s1", xLab = "test")

index1 <- c(1, 1, 3)
index2 <- c(2, 3, 3)
resMat <- subset_hmatrix(hmat, index = index1)
try(resMat2 <- subset_hmatrix(resMat, index = index2))
resMat <- subset_hmatrix(hmat, index = index1, compress = FALSE)
try(resMat2 <- subset_hmatrix(resMat, index = index2))




