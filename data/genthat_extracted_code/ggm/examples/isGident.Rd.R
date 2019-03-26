library(ggm)


### Name: isGident
### Title: G-identifiability of an UG
### Aliases: isGident
### Keywords: graphs models multivariate

### ** Examples

## A not G-identifiable UG
G1 <- UG(~ a*b + u*v)
isGident(G1)
## G-identifiable UG
G2 <- UG(~ a + b + u*v)
isGident(G2)
## G-identifiable UG
G3 <- cmpGraph(UG(~a*b*c+x*y*z))
isGident(G3)



