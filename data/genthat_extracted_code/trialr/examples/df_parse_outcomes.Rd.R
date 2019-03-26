library(trialr)


### Name: df_parse_outcomes
### Title: Parse a string of dose-finding trial outcomes to binary vector
###   notation.
### Aliases: df_parse_outcomes

### ** Examples

x = efftox_parse_outcomes('1NNE 2EEN 3TBB')
x$num_patients == 9
x$eff == c(0, 0, 1, 1, 1, 0, 0, 1, 1)
sum(x$tox) == 3




