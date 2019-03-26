library(RProbSup)


### Name: CalcAAD2
### Title: CalcAAD2
### Aliases: CalcAAD2

### ** Examples

x1 <- rnorm(25)
x2 <- x1 - rnorm(25, mean = 1)
x3 <- x2 - rnorm(25, mean = 1)
y <- cbind(x1, x2, x3)
CalcAAD2(y)



