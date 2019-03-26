library(elec)


### Name: tri.sample
### Title: Sample from List of Precincts PPEB
### Aliases: tri.sample tri.sample.stats

### ** Examples

data(santa.cruz)
Z = elec.data( santa.cruz, C.names=c("danner","leopold") )
samp = tri.calc.sample( Z, beta=0.75, guess.N = 10, p_d = 0.05,
               swing=10, power=0.9, bound="e.plus" )
tri.sample( Z, samp, seed=541227 )



