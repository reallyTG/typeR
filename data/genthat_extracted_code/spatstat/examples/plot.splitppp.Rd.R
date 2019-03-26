library(spatstat)


### Name: plot.splitppp
### Title: Plot a List of Point Patterns
### Aliases: plot.splitppp
### Keywords: spatial hplot

### ** Examples

# Multitype point pattern
 plot(split(amacrine))
 plot(split(amacrine), main="", 
     panel.begin=function(i, y, ...) { plot(density(y), ribbon=FALSE, ...) })



