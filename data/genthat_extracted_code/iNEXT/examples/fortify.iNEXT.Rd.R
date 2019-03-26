library(iNEXT)


### Name: fortify.iNEXT
### Title: Fortify method for classes from the iNEXT package.
### Aliases: fortify.iNEXT

### ** Examples

data(spider)
# single-assemblage abundance data
out1 <- iNEXT(spider$Girdled, q=0, datatype="abundance")
ggplot2::fortify(out1, type=1)



