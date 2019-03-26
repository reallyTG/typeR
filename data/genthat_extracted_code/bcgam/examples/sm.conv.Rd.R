library(bcgam)


### Name: sm.conv
### Title: Specify a smooth and convex shape-restriction in a 'bcgam'
###   formula
### Aliases: sm.conv

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.conv(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smconv <- sm.conv(prestige, numknots=7)

# check attributes
attributes(prestige.smconv)



