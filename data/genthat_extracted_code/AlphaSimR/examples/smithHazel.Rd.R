library(AlphaSimR)


### Name: smithHazel
### Title: Calculate Smith-Hazel weights
### Aliases: smithHazel

### ** Examples

G = 1.5*diag(2)-0.5
E = diag(2)
P = G+E
wt = c(1,1)
smithHazel(wt, G, P)




