library(iNEXT)


### Name: plot.iNEXT
### Title: Plotting iNEXT object
### Aliases: plot.iNEXT

### ** Examples

data(spider)
# single-assemblage abundance data
out1 <- iNEXT(spider$Girdled, q=0, datatype="abundance")
plot(x=out1, type=1)
plot(x=out1, type=2)
plot(x=out1, type=3)




