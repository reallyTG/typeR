library(bcgam)


### Name: sm.decr
### Title: Specify a smooth and decreasing shape-restriction in a 'bcgam'
###   formula
### Aliases: sm.decr

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.decr(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smdecr <- sm.decr(prestige, numknots=7)

# check attributes
attributes(prestige.smdecr)



