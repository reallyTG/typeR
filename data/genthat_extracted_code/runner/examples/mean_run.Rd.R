library(runner)


### Name: mean_run
### Title: Running mean
### Aliases: mean_run

### ** Examples

set.seed(11)
x1 <- rnorm(15)
x2 <- sample(c(rep(NA,5),rnorm(15)), 15, replace=TRUE)
k <- sample(1:15, 15, replace=TRUE)
mean_run(x1)
mean_run(x2, na_rm = TRUE)
mean_run(x2, na_rm = FALSE )
mean_run(x2, na_rm = TRUE, k=4)



