library(NCmisc)


### Name: ppa
### Title: Posterior probability of association function
### Aliases: ppa

### ** Examples

ps <- rep(c(.05,.01),3)
prs <- rep(c(.05,.50,.90),each=2)
mapply(ps,prs,FUN=ppa)  # replicate Nuzzo 2014 table
# try with bayes factors
ppa(BF=3,prior=.9)
ppa(BF=10,prior=.5)



