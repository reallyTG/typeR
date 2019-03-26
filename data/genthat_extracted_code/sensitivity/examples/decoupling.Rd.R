library(sensitivity)


### Name: decoupling
### Title: Decoupling Simulations and Estimations
### Aliases: decoupling tell ask
### Keywords: methods

### ** Examples

# Example of use of fast99 with "model = NULL"
x <- fast99(model = NULL, factors = 3, n = 1000,
            q = "qunif", q.arg = list(min = -pi, max = pi))
y <- ishigami.fun(x$X)
tell(x, y)
print(x)
plot(x)



