library(bcgam)


### Name: sm.decr.conv
### Title: Specify a smooth, decreasing and convex shape-restriction in a
###   'bcgam' formula
### Aliases: sm.decr.conv

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.decr.conv(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smdecrconv <- sm.decr.conv(prestige, numknots=7)

# check attributes
attributes(prestige.smdecrconv)



