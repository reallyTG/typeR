library(lspartition)


### Name: lsprobust
### Title: Partitioning-Based Least Squares Regression with Robust
###   Inference.
### Aliases: lsprobust print.lsprobust summary.lsprobust

### ** Examples

x   <- data.frame(runif(500), runif(500))
y   <- sin(4*x[,1])+cos(x[,2])+rnorm(500)
est <- lsprobust(y, x)
summary(est)




