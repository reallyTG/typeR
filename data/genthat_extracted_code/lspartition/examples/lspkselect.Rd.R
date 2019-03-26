library(lspartition)


### Name: lspkselect
### Title: Tuning Parameter Selection Procedures for Partitioning-Based
###   Regression Estimation and Inference
### Aliases: lspkselect print.lspkselect summary.lspkselect

### ** Examples

x   <- data.frame(runif(500), runif(500))
y   <- sin(4*x[,1])+cos(x[,2])+rnorm(500)
est <- lspkselect(y, x)
summary(est)




