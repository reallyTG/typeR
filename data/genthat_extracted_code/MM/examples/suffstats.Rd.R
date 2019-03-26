library(MM)


### Name: suffstats
### Title: Sufficient statistics for the multiplicative multinomial
### Aliases: suffstats expected_suffstats print.suffstats summary.suffstats
###   print.summary.suffstats

### ** Examples

data(voting)
suffstats(voting, voting_tally)

data(wilson)
wilson <- gunter(non_met)
suffstats(wilson)

L <- Lindsey(wilson)

expected_suffstats(L,5)
summary(suffstats(wilson))  ## matches.

summary(suffstats(rMM(10,5,L))) # should be close.







