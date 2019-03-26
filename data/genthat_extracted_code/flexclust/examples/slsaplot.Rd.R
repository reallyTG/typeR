library(flexclust)


### Name: slsaplot
### Title: Segment Level Stability Across Solutions Plot.
### Aliases: slsaplot
### Keywords: cluster hplot

### ** Examples

data("Nclus")
cl25 <- stepFlexclust(Nclus, k=2:5)
slsaplot(cl25)
cl25 <- relabel(cl25)
slsaplot(cl25)



