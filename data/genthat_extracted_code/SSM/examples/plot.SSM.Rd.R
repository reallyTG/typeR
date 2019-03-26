library(SSM)


### Name: plot.SSM
### Title: Plot smooth supersaturated model main effects
### Aliases: plot.SSM

### ** Examples

# A single variable example
X <- seq(-1, 1, 0.25)
Y <- sapply(X, "^", 3)
s <- fit.ssm(X, Y, GP = TRUE)
plot(s)

# A six variable example
data(attitude)
X <- transform11(attitude[ 2:7])
Y <- attitude[ , 1]
s <- fit.ssm(X, Y)
plot(s)



