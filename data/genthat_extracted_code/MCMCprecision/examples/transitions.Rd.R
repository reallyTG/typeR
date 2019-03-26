library(MCMCprecision)


### Name: transitions
### Title: Get matrix of observed transition frequencies
### Aliases: transitions

### ** Examples

P <- matrix(c(.9,.1,0,
              .1,.6,.3,
              .2,.3,.5), 3, byrow=TRUE)
z <- rmarkov(2000, P)
transitions(z)
transitions(z, order = 2)




