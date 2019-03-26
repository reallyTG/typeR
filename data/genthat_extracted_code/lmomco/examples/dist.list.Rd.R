library(lmomco)


### Name: dist.list
### Title: List of Distribution Names
### Aliases: dist.list
### Keywords: distribution (utility)

### ** Examples

dist.list("gpa")
## Not run: 
##D # Build an L-moment object
##D LM <- vec2lmom(c(10000,1500,0.3,0.1,0.04))
##D lm2 <- lmorph(LM)  # convert to vectored format
##D lm1 <- lmorph(lm2) # and back to named format
##D dist <- dist.list()
##D # Demonstrate that lmom2par internally converts to needed L-moment object
##D for(i in 1:length(dist)) {
##D   # Skip Cauchy and Slash (need TL-moments).
##D   # Skip AEP4, Kumaraswamy, LMRQ, Student t (3-parameter), Truncated Exponential
##D   # are skipped because each is inapplicable to the given L-moments.
##D   # The Eta-Mu and Kappa-Mu are skipped for speed.
##D   if(dist[i] == 'aep4' | dist[i] == 'cau' | dist[i] == 'emu'  | dist[i] == 'gep' |
##D      dist[i] == 'kmu'  | dist[i] == 'kur' | dist[i] == 'lmrq' | dist[i] == 'tri' |
##D      dist[i] == 'sla'  | dist[i] == 'st3' | dist[i] == 'texp') next
##D   print(lmom2par(lm1,type=dist[i])$para)
##D   print(lmom2par(lm2,type=dist[i])$para)
##D }
## End(Not run)



