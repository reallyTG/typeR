library(RProbSup)


### Name: IK2
### Title: IK2
### Aliases: IK2

### ** Examples

x1 <- rnorm(25)
x2 <- x1 - rnorm(25, mean = 1)
x3 <- x2 - rnorm(25, mean = 1)
y <- cbind(x1, x2, x3)
IK2(y)



