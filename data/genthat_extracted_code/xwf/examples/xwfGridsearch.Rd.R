library(xwf)


### Name: xwfGridsearch
### Title: Adaptive grid search
### Aliases: xwfGridsearch

### ** Examples

# Data simulation similar to Section 3.2 of the paper

# Sample size
n <- 100

# Length of trajectories
n.i <- rep(5, n)
max.n.i <- max(n.i)

# Times
t <- matrix(NA_integer_, nrow = n, ncol = max.n.i)
for(i in 1:n) t[i, 1:n.i[i]] <- 1:n.i[i]


# Sample periods
phi <- runif(n = n, min = 1, max = 10)

# Sample offsets
m <- 10*runif(n = n)

# Blood pressure measurements
x <- t
for(i in 1:n) x[i, 1:n.i[i]] <- sin(phi[i] * 2*pi/max.n.i * t[i, 1:n.i[i]]) + m[i]

# Matrix with covariates z
q <- 2 # Number of covariates
z <- matrix(rnorm(n = n*q), nrow = n, ncol = q)

# Generate outcomes
temp <- phi*min(m, 7)
temp <- 40*temp
prob <- 1/(1+exp( 2*( median(temp)-temp ) ))
y <- rbinom(n = n, size = 1, prob = prob)

xx <- list()
for(i in 1:n) xx[[i]] <- approxfun(x = t[i,1:n.i[i]], y = x[i,1:n.i[i]], rule = 2)

# Estimate f
weights <- matrix(1/n.i, ncol = max.n.i, nrow = n)[!is.na(t)]
f <- density(
x = t(sapply(X = 1:n, FUN = function(i) c(xx[[i]](t[i,1:n.i[i]]), rep(NA, max.n.i-n.i[i])))),
weights = weights/sum(weights),
na.rm = T
)

# Define CDF of f, F
CDF <- c(0)
for(i in 2:length(f$x)) CDF[i] <- CDF[i-1]+(f$x[i]-f$x[i-1])*(f$y[i]+f$y[i-1])/2
F <- approxfun(x = f$x, y = CDF/max(CDF), yleft = 0, yright = 1)

psi <- list(
  function(x, t) abs(x(t)-x(t-1))
)

XWFresult <- xwfGridsearch(y = y, xx = xx, t = t, n.i = n.i, psi.list = psi, F = F, z = z)

summary(XWFresult$GAMobject)
XWFresult$b.left
XWFresult$b.right





