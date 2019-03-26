library(SAVER)


### Name: calc.maxcor
### Title: Calculate maximum correlation
### Aliases: calc.maxcor

### ** Examples

x1 <- matrix(rnorm(500), 100, 5)
x2 <- x1 + matrix(rnorm(500), 100, 5)
colnames(x1) <- c("A", "B", "C", "D", "E")
colnames(x2) <- c("A", "B", "C", "D", "E")
cor(x1, x2)
calc.maxcor(x1, x2)




