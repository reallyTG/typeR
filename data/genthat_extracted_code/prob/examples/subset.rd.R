library(prob)


### Name: subset
### Title: Subsets of Probability Spaces
### Aliases: subset subset.ps
### Keywords: misc

### ** Examples

L <- tosscoin(2)
M <- urnsamples(L, 3)
N <- probspace(M)
subset(N, all(toss1=="H"))
subset(N, any(toss2=="T"))



