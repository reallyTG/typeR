library(VGAM)


### Name: lqnorm
### Title: Minimizing the L-q norm Family Function
### Aliases: lqnorm
### Keywords: models regression

### ** Examples

set.seed(123)
ldata <- data.frame(x = sort(runif(nn <- 10 )))
realfun <- function(x) 4 + 5*x
ldata <- transform(ldata, y = realfun(x) + rnorm(nn, sd = exp(-1)))
# Make the first observation an outlier
ldata <- transform(ldata, y = c(4*y[1], y[-1]), x = c(-1, x[-1]))
fit <- vglm(y ~ x, lqnorm(qpower = 1.2), data = ldata)
coef(fit, matrix = TRUE)
head(fitted(fit))
fit@misc$qpower
fit@misc$objectiveFunction

## Not run: 
##D # Graphical check
##D with(ldata, plot(x, y, main = paste("LS = red, lqnorm = blue (qpower = ",
##D              fit@misc$qpower, "), truth = black", sep = ""), col = "blue"))
##D lmfit <- lm(y ~ x, data = ldata)
##D with(ldata, lines(x,  fitted(fit), col = "blue"))
##D with(ldata, lines(x, lmfit$fitted, col = "red"))
##D with(ldata, lines(x,  realfun(x),  col = "black")) 
## End(Not run)



