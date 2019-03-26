library(RND)


### Name: pgb
### Title: CDF of Generalized Beta
### Aliases: pgb

### ** Examples


#
# What does the cdf of a GB look like?
#

a  = 1
b  = 10
v  = 2
w  = 2

x = seq(from = 0, to = 500, by = 0.01)
y = pgb(x = x, a = a, b = b, v = v, w = w)
plot(y ~ x, type = "l")
abline(h=c(0,1), lty=2) 




