library(RND)


### Name: dgb
### Title: Generalized Beta Density
### Aliases: dgb

### ** Examples

#
# Just simple plot of the density
#

x = seq(from = 500, to = 1500, length.out = 10000)
a = 10
b = 1000
v = 3
w = 3
dx = dgb(x = x, a = a, b = b, v = v, w = w)
plot(dx ~ x, type="l")




