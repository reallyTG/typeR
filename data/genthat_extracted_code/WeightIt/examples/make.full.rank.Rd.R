library(WeightIt)


### Name: make.full.rank
### Title: Make a matrix full rank
### Aliases: make.full.rank

### ** Examples

set.seed(1000)
c1 <- rbinom(10, 1, .4)
c2 <- 1-c1
c3 <- rnorm(10)
c4 <- 10*c3
mat <- data.frame(c1, c2, c3, c4)

make.full.rank(mat) #leaves c2 and c4

make.full.rank(mat, with.intercept = FALSE) #leaves c1, c2, and c4



