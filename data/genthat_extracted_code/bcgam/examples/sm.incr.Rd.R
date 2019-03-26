library(bcgam)


### Name: sm.incr
### Title: Specify a smooth and increasing shape-restriction in a 'bcgam'
###   formula
### Aliases: sm.incr

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.incr(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smincr <- sm.incr(prestige, numknots=7)

# check attributes
attributes(prestige.smincr)



