library(Biolinv)


### Name: SDS
### Title: Generates a list of dispersal vectors.
### Aliases: SDS

### ** Examples

dist<- seq(.1, 30, .1)
prob<- fx(x=dist, a=7, c=2)
deltas<- SDS(DIST=dist, probDist=prob)



