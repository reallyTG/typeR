library(iNEXT)


### Name: ggiNEXT
### Title: ggplot2 extension for an iNEXT object
### Aliases: ggiNEXT ggiNEXT.iNEXT ggiNEXT.default

### ** Examples

data(spider)
# single-assemblage abundance data
out1 <- iNEXT(spider$Girdled, q=0, datatype="abundance")
ggiNEXT(x=out1, type=1)
ggiNEXT(x=out1, type=2)
ggiNEXT(x=out1, type=3)

## Not run: 
##D # single-assemblage incidence data with three orders q
##D data(ant)
##D size <- round(seq(10, 500, length.out=20))
##D y <- iNEXT(ant$h500m, q=c(0,1,2), datatype="incidence_freq", size=size, se=FALSE)
##D ggiNEXT(y, se=FALSE, color.var="order")
##D 
##D # multiple-assemblage abundance data with three orders q
##D z <- iNEXT(spider, q=c(0,1,2), datatype="abundance")
##D ggiNEXT(z, facet.var="site", color.var="order")
##D ggiNEXT(z, facet.var="both", color.var="both")
## End(Not run)



