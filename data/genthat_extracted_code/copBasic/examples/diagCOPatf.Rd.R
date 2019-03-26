library(copBasic)


### Name: diagCOPatf
### Title: Numerical Rooting the Diagonal of a Copula
### Aliases: diagCOPatf diagCOPinv
### Keywords: visualization diagnostics copula (characteristics)

### ** Examples

diagCOPatf(0.67, cop=PSP) # 0.8023879
diagCOPatf(0.99, cop=M)   # 0.99 (now see the example below)
## Not run: 
##D # Several functions from the lmomco package are needed.
##D # Suppose we have two phenomena with these log10 L-moments:
##D lmrA <- lmomco::vec2lmom(c(3.97, 0.485, -0.1178, 0.06857))
##D lmrB <- lmomco::vec2lmom(c(3.77, 0.475, -0.1377, 0.08280))
##D # Suppose we think that the Gumbel-Hougaard copula is appropriate with a Tau=0.45
##D Tau <- 0.45 #  Kendall's Tau between A and B.
##D # Suppose that the F=0.99 for either A and B provides a common risk level when they
##D # are considered in isolation. But what if A and B are rivers that join and joint
##D # F=0.99 at their union is of interest?
##D F <- 0.99
##D parA   <- lmomco::lmom2par(lmrA, type="kap")
##D parB   <- lmomco::lmom2par(lmrB, type="kap")
##D EventA <- lmomco::qlmomco(F, parA)
##D EventB <- lmomco::qlmomco(F, parB)
##D ApB <- 10^(EventA) + 10^(EventB) # Purely an additive conceptualization
##D # The F=0.99 event is assumed to occur simultaneously on both streams, which is
##D # equivalent to saying that the correlation between the two is absolute 1-to-1.
##D 
##D # Now consider including the association as measured by Kendall Tau:
##D Fjoint  <- diagCOPatf(F, cop=GHcop, para=GHcop(tau=Tau)$para)
##D EventAj <- lmomco::qlmomco(Fjoint, parA)
##D EventBj <- lmomco::qlmomco(Fjoint, parB)
##D AcB <- 10^(EventAj) + 10^(EventBj) # Joint probability 0.99 at the union
##D 
##D # Now consider the association if the streams are INDEPENDENT:
##D Fjoint  <- diagCOPatf(F, cop=GHcop, para=GHcop(tau=0)$para)
##D EventAj <- lmomco::qlmomco(Fjoint, parA)
##D EventBj <- lmomco::qlmomco(Fjoint, parB)
##D AiB <- 10^(EventAj) + 10^(EventBj) # Joint probability 0.99 at the union
##D 
##D # ApB = 312,000 # The perfectly simultaneous addition makes too little.
##D # AcB = 323,000 # The copula preserves at least the known association.
##D # AiB = 330,000 # The independence conceptualization makes too much.
## End(Not run)



