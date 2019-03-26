library(RND)


### Name: dshimko
### Title: Density Implied by Shimko Method
### Aliases: dshimko

### ** Examples


#
# a0, a1, a2 values come from Shimko's paper.
#

r     =  0.05
y     =  0.02
a0    =  0.892
a1    = -0.00387
a2    =  0.00000445
te    =  60/365
s0    =  400
k     =  seq(from = 250, to = 500, by = 1)
sigma =  0.15

#
# Does it look like a proper density and intergate to one?
#

dx = dshimko(r = r, te = te, s0 = s0, k = k, y = y, a0 = a0, a1 = a1, a2 = a2)
plot(dx ~ k, type="l")

#
# sum(dx) should be about 1 since dx is a density.
#

sum(dx)




