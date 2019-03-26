library(SimPhe)


### Name: build.cor.phe
### Title: Build correlated phenotypes
### Aliases: build.cor.phe

### ** Examples

x1 <- rnorm(4000, mean = 5, sd = 10)
x2 <- rnorm(4000, mean = 10, sd = 30)
x <- matrix(cbind(x1, x2), ncol = 2)

# test original correlation
cor.test(x[, 1], x[, 2])

# correlation matrix
corM <- matrix(c(1, 0.6, 0.6, 1), ncol = 2)

# standard deviation matrix
sdM <- matrix(c(10, 0, 0, 30), ncol = 2)

# build correlation
x.new <- build.cor.phe(x, corM, sdM)

# check mean and standard deviation of new data set
apply(x.new, 2, mean)
apply(x.new, 2, sd)

# test correlation
cor.test(x.new[, 1], x.new[, 2])



