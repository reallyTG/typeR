library(psych)


### Name: Tal_Or
### Title: Data set testing causal direction in presumed media influence
### Aliases: Tal_Or Tal.Or pmi tctg
### Keywords: datasets

### ** Examples

data(Tal.Or)
mediate(reaction ~ cond + (pmi), data =Tal.Or,n.iter=50) 




