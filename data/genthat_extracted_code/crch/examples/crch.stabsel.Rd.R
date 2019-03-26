library(crch)


### Name: crch.stabsel
### Title: Auxiliary functions to perform stability selection using
###   boosting.
### Aliases: crch.stabsel
### Keywords: regression

### ** Examples

# generate data
set.seed(5)
x <- matrix(rnorm(1000*20),1000,20)
y <- rnorm(1000, 1 + x[,1] - 1.5 * x[,2], exp(-1 + 0.3*x[,3]))
y <- pmax(0, y)
data <- data.frame(cbind(y, x))

# fit model with maximum likelihood
CRCH1 <- crch(y ~ .|., data = data, dist = "gaussian", left = 0)

# Perform stability selection
stabsel <- crch.stabsel(y ~ .|.,  data = data, dist = "gaussian", left = 0,
           q = 8, B = 5)

# Show stability selection summary
print(stabsel); plot(stabsel)

CRCH2 <- crch(stabsel$formula.new, data = data, dist = "gaussian", left = 0 )
BOOST <- crch(stabsel$formula.new, data = data, dist = "gaussian", left = 0,
              control = crch.boost() )

### AIC comparison
sapply( list(CRCH1,CRCH2,BOOST), logLik )



