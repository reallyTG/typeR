library(SMM)


### Name: InitialLawSM
### Title: Estimation of the initial law (semi-Markov model)
### Aliases: InitialLawSM
### Keywords: Semi-Markov models

### ** Examples

seq = list(c("a","c","c","g","t","a","a","a","a","g","c","t","t","t","g"))
res = estimSM(seq = seq, E = c("a","c","g","t"), distr = "NP")
q = res$q
p = res$Ptrans

InitialLawSM(E = c("a","c","g","t"), seq = seq, q = q)



