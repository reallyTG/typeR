library(optiscale)


### Name: elec92
### Title: Public Opinion During the 1992 U.S. Presidential Election
### Aliases: elec92
### Keywords: datasets

### ** Examples

library(optiscale)
data(elec92)
summary(lm(choice ~ party + ideol + econ4yr, data = elec92))



