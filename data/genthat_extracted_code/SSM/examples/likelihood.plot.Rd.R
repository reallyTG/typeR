library(SSM)


### Name: likelihood.plot
### Title: Plot the concentrated likelihood of an SSM.
### Aliases: likelihood.plot

### ** Examples

data(attitude)
X <- transform11(attitude[ 2:7])
Y <- attitude[ , 1]
s <- fit.ssm(X, Y, GP = TRUE)
likelihood.plot(s)
likelihood.plot(s, xrange = c(0, 20))



