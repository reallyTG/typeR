library(coop)
set.seed(1234)

m <- 30
n <- 5
x <- matrix(rnorm(m*n), m, n)


t1 <- cov(x)
t2 <- covar(x, inplace=TRUE)
stopifnot(all.equal(t1, t2))

t1 <- cor(x)
t2 <- pcor(x, inplace=TRUE)
stopifnot(all.equal(t1, t2))
