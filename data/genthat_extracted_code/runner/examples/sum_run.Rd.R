library(runner)


### Name: sum_run
### Title: Running sum
### Aliases: sum_run

### ** Examples

set.seed(11)
x1 <- rnorm(15)
x2 <- sample(c(rep(NA,5),rnorm(15)), 15, replace=TRUE)
k <- sample(1:15, 15, replace=TRUE)
sum_run(x1)
sum_run(x2, na_rm = TRUE)
sum_run(x2, na_rm = FALSE )
sum_run(x2, na_rm = TRUE, k=4)



