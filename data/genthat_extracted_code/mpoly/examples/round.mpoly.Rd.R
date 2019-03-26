library(mpoly)


### Name: round.mpoly
### Title: Round the coefficients of a polynomial
### Aliases: round.mpoly

### ** Examples


p <- mp("x + 3.14159265")^4
p
round(p)
round(p, 0)

## Not run: 
##D library(plyr)
##D library(ggplot2)
##D library(stringr)
##D 
##D n <- 101
##D s <- seq(-5, 5, length.out = n)
##D 
##D # one dimensional case
##D df <- data.frame(x = s)
##D df <- mutate(df, y = -x^2 + 2*x - 3 + rnorm(n, 0, 2))
##D qplot(x, y, data = df)
##D mod <- lm(y ~ x + I(x^2), data = df)
##D p <- as.mpoly(mod)
##D qplot(x, y, data = df) +
##D   stat_function(fun = as.function(p), colour = 'red')
##D 
##D p
##D round(p, 1)
##D qplot(x, y, data = df) +
##D   stat_function(fun = as.function(p), colour = 'red') +
##D   stat_function(fun = as.function(round(p,1)), colour = 'blue')
##D 
##D 
## End(Not run)




