library(ggm)


### Name: anger
### Title: Anger data
### Aliases: anger
### Keywords: datasets

### ** Examples
 
# Fit a chordless 4-cycle model 
data(anger) 
G = UG(~ Y*X + X*Z + Z*U + U*Y)
fitConGraph(G,anger, 684) 



