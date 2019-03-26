library(pipeGS)


### Name: get.phat.linear
### Title: Get the pvalue for the linear statistic
### Aliases: get.phat.linear

### ** Examples

x <- c(rep(0, 4), rep(1, 4))
y <- c(rnorm(4, 0, 1), rnorm(4, 2 ,1))
get.phat.linear(x, y, method = "saddlepoint")
get.phat.linear(x, y, method = "phat1")
get.phat.linear(x, y, method = "phat2")
get.phat.linear(x, y, method = "phat3")
get.phat.linear(x, y, method = "nested")
get.phat.linear(x, y, method = "mc")
get.phat.linear(x, y, method = "exact")
get.phat.linear(x, y, method = "saddlepoint", do.sd = TRUE)
get.phat.linear(x, y, method = "phat1", do.sd = TRUE)
get.phat.linear(x, y, method = "phat2", do.sd = TRUE)
get.phat.linear(x, y, method = "phat3", do.sd = TRUE)
get.phat.linear(x, y, method = "nested", do.sd = TRUE)
get.phat.linear(x, y, method = "mc", do.sd = TRUE)
get.phat.linear(x, y, method = "exact", do.sd = TRUE)



