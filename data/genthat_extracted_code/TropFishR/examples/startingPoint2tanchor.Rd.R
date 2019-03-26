library(TropFishR)


### Name: startingPoint2tanchor
### Title: Convert FiSAT's starting point to t_anchor value
### Aliases: startingPoint2tanchor
### Keywords: function lfq startingPoints t_anchor

### ** Examples

data(synLFQ5)
lfqNEW <- startingPoint2tanchor(synLFQ5, par = list(Linf = 92, K = 0.37),
   startingLength = 31, startingSample = 4)
lfqRest <- lfqRestructure(lfqNEW, MA = 11)
plot(lfqRest,par=list(Linf=lfqRest$Linf,K=lfqRest$K,t_anchor=lfqRest$t_anchor))




