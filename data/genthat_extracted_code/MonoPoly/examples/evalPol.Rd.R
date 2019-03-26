library(MonoPoly)


### Name: evalPol
### Title: Evaluating Polynomials
### Aliases: evalPol
### Keywords: utilities regression

### ** Examples

beta <- c(1,2,1)

x <- 0:10
evalPol(x, beta)
str(evalPol(x, beta))

x <- cbind(0:10, 10:0)
evalPol(x, beta)
str(evalPol(x, beta))


x <- data.frame(x=0:10, y=10:0)
evalPol(x, beta)
str(evalPol(x, beta))



