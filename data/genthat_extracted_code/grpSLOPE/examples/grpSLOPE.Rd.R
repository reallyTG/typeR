library(grpSLOPE)


### Name: grpSLOPE
### Title: Group SLOPE (Group Sorted L-One Penalized Estimation)
### Aliases: grpSLOPE

### ** Examples

# generate some data
set.seed(1)
A   <- matrix(rnorm(100^2), 100, 100)
grp <- rep(rep(1:20), each=5)
b   <- c(runif(20), rep(0, 80))
# (i.e., groups 1, 2, 3, 4, are truly significant)
y   <- A %*% b + rnorm(10) 
fdr <- 0.1 # target false discovery rate
# fit a Group SLOPE model
result <- grpSLOPE(X=A, y=y, group=grp, fdr=fdr)
result$selected
# [1] "1"  "2"  "3"  "4"  "14"
result$sigma
# [1] 0.7968632
head(result$group.norms)
#         1         2         3         4         5         6 
#  2.905449  5.516103  8.964201 10.253792  0.000000  0.000000 




