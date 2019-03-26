library(migest)


### Name: rc9.fund
### Title: Fundamental Parameters for Rogers-Castro Migration Schedule
### Aliases: rc9.fund
### Keywords: datasets

### ** Examples

# check format
str(rc9.fund)

# single age groups
x <- 1:100
m <- rc9(x, param = rc9.fund)
plot(x, m, type="l")

# alter to see the effect of mu2
p1 <- rc9.fund
p1$mu2 <- 30
m1 <- rc9(x, param = p1)
plot(x, m, type="l")
lines(x, m1, lty=2)



