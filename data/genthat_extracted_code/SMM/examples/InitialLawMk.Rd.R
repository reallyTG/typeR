library(SMM)


### Name: InitialLawMk
### Title: Estimation of the initial law (Markov model)
### Aliases: InitialLawMk
### Keywords: Markov models

### ** Examples

seq = list(c("a","c","c","g","t","a","a","a","a","g","c","t","t","t","g"))
res = estimMk(seq = seq, E = c("a","c","g","t"), k = 1)
p = res$Ptrans

InitialLawMk(E = c("a","c","g","t"), seq = seq, Ptrans = p, k = 1)



