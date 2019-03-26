library(MM)


### Name: rMM
### Title: Random samples from the multiplicative multinomial
### Aliases: rMM dMM

### ** Examples

data(voting)
rMM(10,4,Lindsey(voting,voting_tally))

p <- paras(3)
theta(p) <- 2
dMM(1:3,p)




