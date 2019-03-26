library(propagate)


### Name: summary.propagate
### Title: Summary function for 'propagate' objects
### Aliases: summary.propagate
### Keywords: models nonlinear

### ** Examples

EXPR1 <- expression(x^2 * sin(y))
x <- c(5, 0.01)
y <- c(1, 0.01)
DF1 <- cbind(x, y)
RES1 <- propagate(expr = EXPR1, data = DF1, type = "stat", 
                  do.sim = TRUE, verbose = TRUE, nsim = 100000)
summary(RES1)



