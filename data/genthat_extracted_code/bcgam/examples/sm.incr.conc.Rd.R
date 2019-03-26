library(bcgam)


### Name: sm.incr.conc
### Title: Specify a smooth, increasing and concave shape-restriction in a
###   'bcgam' formula
### Aliases: sm.incr.conc

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.incr.conc(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smincrconc <- sm.incr.conc(prestige, numknots=7)

# check attributes
attributes(prestige.smincrconc)



