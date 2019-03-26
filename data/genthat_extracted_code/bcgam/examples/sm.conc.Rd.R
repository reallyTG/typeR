library(bcgam)


### Name: sm.conc
### Title: Specify a smooth and concave shape-restriction in a 'bcgam'
###   formula
### Aliases: sm.conc

### ** Examples

data(duncan)

prestige <- duncan$prestige

# specify knots
sm.conc(prestige, knots=c(3,9,30,57,86,97))

# specify number of knots
prestige.smconc <- sm.conc(prestige, numknots=7)

# check attributes
attributes(prestige.smconc)



