library(elec)


### Name: tri.calc.sample
### Title: Calculate needed sample size for election auditing using the
###   Trinomial Bound
### Aliases: tri.calc.sample

### ** Examples

data(santa.cruz)
Z = elec.data( santa.cruz, C.names=c("danner","leopold") )
tri.calc.sample( Z, beta=0.75, guess.N = 10, p_d = 0.05,
               swing=10, power=0.9, bound="e.plus" )



