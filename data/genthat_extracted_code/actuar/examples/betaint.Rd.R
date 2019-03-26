library(actuar)


### Name: betaint
### Title: The "Beta Integral"
### Aliases: betaint
### Keywords: math distribution

### ** Examples

x <- 0.3
a <- 7

## case with b > 0
b <- 2
actuar:::betaint(x, a, b)
gamma(a) * gamma(b) * pbeta(x, a, b)    # same

## case with b < 0
b <- -2.2
r <- floor(-b)        # r = 2
actuar:::betaint(x, a, b)

## "manual" calculation
s <- (x^(a-1) * (1-x)^b)/b +
    ((a-1) * x^(a-2) * (1-x)^(b+1))/(b * (b+1)) +
    ((a-1) * (a-2) * x^(a-3) * (1-x)^(b+2))/(b * (b+1) * (b+2))
-gamma(a+b) * s +
    (a-1)*(a-2)*(a-3) * gamma(a-r-1)/(b*(b+1)*(b+2)) *
    gamma(b+r+1)*pbeta(x, a-r-1, b+r+1)



