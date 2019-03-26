library(sampler)


### Name: cpro
### Title: Calculate proportion and margin of error (unequal-sized cluster
###   sample)
### Aliases: cpro

### ** Examples

alresults <- ssamp(albania, 890, qarku)
cpro(df=alresults, numerator=totalVoters, denominator=zgjedhes, ci=95)
cpro(df=alresults, numerator=pd, denominator=validVotes, ci=95, N=5361)



