library(TSMCP)


### Name: tsmcplm
### Title: Two stage multiple change point detection in linear models.
### Aliases: tsmcplm

### ** Examples

## example 1: mean shift model
## true change point location:
## 100, 130, 150, 230, 250, 400, 440, 650, 760, 780, 810
Y <- rnorm(1000, 0, 0.5) +
  c(rep(0,100), rep(4,30),rep(-1,20), rep(2,80), rep(-2,20),
    rep(3,150), rep(-1, 40), rep(1,210), rep(5,110), rep(2,20),
    rep(7,30), rep(3,190))
ts.plot(Y)

##estimate change points
tsmcplm(Y = Y, X = NULL, method = "adapt", c = 0.3)


## example 2: linear model:
## a periodic auto correlation series with period 122 and
## order of auto correlation 1

###
## true change point location:
## 200, 350, 450, 550, 700, and 850


n <- 1000
y <- rnorm(n)
for (t in 2:n) {
  y[t] <- cos(t*pi/61) + 3*sin(t*pi/61) + 0.5*y[t-1] + (2*sin(t*pi/61) +
  0.1 * y[t-1])*(200 < t)+ (2* cos(t*pi/61)- 4 *sin(t*pi/61)- 0.6* y[t-1] )*
  (350 < t) + (2* sin(t*pi/61) + 0.7* y[t-1] )*(450 < t) + (-3* sin(t*pi/61) -
  0.3* y[t-1] )*(550 < t) + (-3* cos(t*pi/61) + 5* sin(t*pi/61))* (700 < t) +
  (3* cos(t*pi/61) - 5* sin(t*pi/61) - 0.4*y[t-1] )* (850 < t) + rnorm(1)
}
ts.plot(y)

x <- sapply(2:n, function(t){cbind(cos(t*pi/61), sin(t*pi/61), y[t-1])},
            simplify = FALSE)
x <- do.call(rbind, x)
tsmcplm(Y = y[-1], X = x, method = "adapt", c = 2)





