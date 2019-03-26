library(epimdr)


### Name: llik.cb
### Title: Negative log-likelihood function for the chain-binomial model
### Aliases: llik.cb

### ** Examples

twoweek=rep(1:15, each=2)
niamey_cases1=sapply(split(niamey$cases_1[1:30], twoweek), sum)
llik.cb(S0=6500, beta=23, I=niamey_cases1)



