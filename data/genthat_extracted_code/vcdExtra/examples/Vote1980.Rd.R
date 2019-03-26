library(vcdExtra)


### Name: Vote1980
### Title: Race and Politics in the 1980 Presidential Vote
### Aliases: Vote1980
### Keywords: datasets

### ** Examples

data(Vote1980)
fourfold(xtabs(Freq ~ race + votefor + conservatism, data=Vote1980), mfrow=c(2,4))




