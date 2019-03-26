library(bcgam)


### Name: sm.decr.conc
### Title: Specify a smooth, decreasing and concave shape-restriction in a
###   'bcgam' formula
### Aliases: sm.decr.conc

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.decr.conc(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smdecrconc <- sm.decr.conc(prestige, numknots=7)

# check attributes
attributes(prestige.smdecrconc)



