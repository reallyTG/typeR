library(propagate)


### Name: plot.propagate
### Title: Plotting function for 'propagate' objects
### Aliases: plot.propagate
### Keywords: models nonlinear

### ** Examples

EXPR1 <- expression(x^2 * sin(y))
x <- c(5, 0.01)
y <- c(1, 0.01)
DF1 <- cbind(x, y)
RES1 <- propagate(expr = EXPR1, data = DF1, type = "stat", 
                  nsim = 100000, alpha = 0.01)
plot(RES1)



