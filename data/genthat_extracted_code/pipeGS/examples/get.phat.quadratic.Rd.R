library(pipeGS)


### Name: get.phat.quadratic
### Title: Get the pvalue for the quadratic statistic
### Aliases: get.phat.quadratic

### ** Examples

x <- c(rep(0, 4), rep(1, 4))
y <- matrix(c(rnorm(4*5, 0, 1), rnorm(4*5, 2 ,1)), nrow = 8)
get.phat.quadratic(x, y, method = "is")
get.phat.quadratic(x, y, method = "nested")
get.phat.quadratic(x, y, method = "mc")
get.phat.quadratic(x, y, method = "exact")
get.phat.quadratic(x, y, method = "is", do.sd = TRUE)
get.phat.quadratic(x, y, method = "nested", do.sd = TRUE)
get.phat.quadratic(x, y, method = "mc", do.sd = TRUE)
get.phat.quadratic(x, y, method = "exact", do.sd = TRUE)



