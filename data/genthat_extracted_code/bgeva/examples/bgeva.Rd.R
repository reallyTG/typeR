library(bgeva)


### Name: bgeva
### Title: Binary Generalized Extreme Value Additive Modelling
### Aliases: bgeva
### Keywords: binary rare events data generalized extreme value
###   distribution link function smooth regression spline

### ** Examples


library(bgeva)

##########
## EXAMPLE 
##########

set.seed(0)

n <- 1500

x1 <- round(runif(n))
x2 <- runif(n)
x3 <- runif(n)

f1 <- function(x) (cos(pi*2*x)) + sin(pi*x)
f2 <- function(x) (x+exp(-30*(x-0.5)^2))   

y <- as.integer(rlogis(n, location = -6 + 2*x1 + f1(x2) + f2(x3), scale = 1) > 0)

dataSim <- data.frame(y,x1,x2,x3)

out <- bgeva(y ~ x1 + s(x2) + s(x3))
bg.checks(out)

summary(out)
plot(out,scale=0,pages=1,shade=TRUE)


#
#




