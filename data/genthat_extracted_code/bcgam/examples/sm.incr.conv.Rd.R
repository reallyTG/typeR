library(bcgam)


### Name: sm.incr.conv
### Title: Specify a smooth, increasing and convex shape-restriction in a
###   'bcgam' formula
### Aliases: sm.incr.conv

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.incr.conv(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smincrconv <- sm.incr.conv(prestige, numknots=7)

# check attributes
attributes(prestige.smincrconv)



