library(RProbSup)


### Name: AAD2
### Title: AAD2
### Aliases: AAD2

### ** Examples

x1 <- rnorm(25)
x2 <- x1 - rnorm(25, mean = 1)
x3 <- x2 - rnorm(25, mean = 1)
y <- cbind(x1, x2, x3)
AAD2(y)



