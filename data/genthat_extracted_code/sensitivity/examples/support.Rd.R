library(sensitivity)


### Name: support
### Title: Support index functions: Measuring the effect of input variables
###   over their support
### Aliases: support

### ** Examples


# -----------------
# ishigami function
# -----------------
n <- 5000
n.points <- 1000
d <- 3

set.seed(0)
X <- matrix(runif(d*n, min = -pi, max = pi), n, d)
Xnew <- matrix(seq(from = -pi, to = pi, length=n.points), n.points, d)

b <- support(model = ishigami.fun, X, Xnew)

# plot method (x-axis in probability scale), of the normalized support index functions
plot(b, col = c("lightskyblue4", "lightskyblue1", "black"), 
     xprob = TRUE, p = 'punif', p.arg = list(min = -pi, max = pi), ylim = c(0, 2))

# below : diagonal scatterplots of the gradient, 
# on which are based the estimation by smoothing
scatterplot(b, xprob = TRUE) 

# now with normal margins
# -----------------------
X <- matrix(rnorm(d*n), n, d)
Xnew <- matrix(rnorm(d*n.points), n.points, d)
b <- support(model = ishigami.fun, X, Xnew)

plot(b, col = c("lightskyblue4", "lightskyblue1", "black"), xprob = FALSE)
scatterplot(b, xprob = FALSE, type = "histogram", bins = 10, cex = 1, cex.lab = 1.5)



