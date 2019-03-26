library(corset)


### Name: corset
### Title: Arbitrary Bounding of Series and Time Series Objects
### Aliases: corset

### ** Examples


## Comparison of methods ##
###########################

x <- ts(sin(seq(-2*pi, pi, 0.3)))
x.b.0 <- corset(x,'bezier')
x.b.1 <- corset(x,'bezier', proximity = 1)
x.e <- corset(x,'exp')
x.n <- corset(x,'naive')

layout(matrix(c(1,2,1,3),ncol=2))
plot(x, type = 'o', lwd = 3, main = 'Partial Bezier [0,Inf)\nproximity = 0/1')
lines(x.b.0, col = 'blue', lwd = 3, lty = 1)
lines(x.b.1, col = 'blue', lwd = 3, lty = 1)
abline(h=0)

plot(x, type = 'o', lwd = 3, main = 'Exponential [0,Inf)')
lines(x.e, col = 'green', lwd = 3, lty = 1)
abline(h=0)

plot(x, type = 'o', lwd = 3, main = 'Naive [0,Inf)')
lines(x.n, col = 'red', lwd = 3, lty = 1)
abline(h=0)
layout(1)

## Linear Boundaries Example ##
###############################

x <- ts(sin(seq(-5*pi, 5*pi, length.out = 200)))
min <- seq(-0.1,-1, length.out = 200)
max <- seq(0.1,1, length.out = 200)
plot(x, main = 'Partial Bezier\nLinear Boundaries')
lines(min, col = 'red')
lines(max, col = 'green')
lines(corset(x, method = 'bezier',
             min = min, max = max, proximity = 2),
      lwd = 3, col = 'blue')

## Centrality Example for forecast object ##
############################################

if ('forecast' %in% installed.packages()){
  layout(matrix(c(1,2,3),ncol=1))
  f <- forecast::forecast(forecast::ets(ts(33:14 + rep(c(-8,8),10), frequency = 2), 'AAN'),50)
  plot(f, main = 'forecast object | f'); abline(h=0, lwd = 2)
  c <- corset(f, centrality = FALSE)
  plot(c, main = '"Corseted" forecast object | corset(f)')
  cc <- corset(f, centrality = TRUE)
  plot(cc, main = '"Corseted" forecast object | corset(f, centrality = TRUE)')
  layout(1)
}




