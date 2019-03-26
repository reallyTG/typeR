library(distrTeach)


### Name: illustrateLLN
### Title: Functions for Illustrating the LLN
### Aliases: illustrateLLN
### Keywords: distribution methods dynamic

### ** Examples

illustrateLLN(Distr = Unif())
illustrateLLN(Distr = Pois(lambda = 2))
illustrateLLN(Distr = Pois(lambda = 2)+Unif())
illustrateLLN(Td(3), m = 50, col.Eline = "green", lwd = 2, cex = 0.6, main = 
 "My LLN %C%Q", sub = "generated %D")
illustrateLLN(Td(3), m = 50, CLTorCheb = "Chebyshev") 
illustrateLLN(Td(3), m = 50, CLTorCheb = "Chebyshev", coverage = 0.75) 



