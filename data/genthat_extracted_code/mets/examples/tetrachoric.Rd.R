library(mets)


### Name: tetrachoric
### Title: Estimate parameters from odds-ratio
### Aliases: tetrachoric or2prob

### ** Examples

tetrachoric(0.3,1.25) # Marginal p1=p2=0.3, OR=2
P <- matrix(c(0.1,0.2,0.2,0.5),2)
prod(diag(P))/prod(lava::revdiag(P))
##mets:::assoc(P)
tetrachoric(P)
or2prob(2,0.1)
or2prob(2,c(0.1,0.2))



