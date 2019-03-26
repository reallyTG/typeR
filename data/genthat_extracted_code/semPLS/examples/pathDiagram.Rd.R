library(semPLS)


### Name: pathDiagram
### Title: Draw Path Diagram
### Aliases: pathDiagram pathDiagram.sempls

### ** Examples

### create .pdf file for the path diagram
### Note that graphviz (www.graphviz.org) must be available.
## Not run: 
##D pathDiagram(ecsi, file="ecsiPLS1", edge.labels="both",
##D             output.type="graphics", digits=3, graphics.fmt = "pdf")
##D 
##D # include R-squared values
##D rSquared <- rSquared(ecsi)
##D pathDiagram(ecsi, file="ecsiPLS2", edge.labels="both",
##D             output.type="graphics", digits=3, graphics.fmt = "pdf",
##D             rSquared=Rsquared)
##D 
##D # only the structural model
##D pathDiagram(ecsi, file="ecsiPLS3", edge.labels="both",
##D             output.type="graphics", digits=3, graphics.fmt = "pdf",
##D             rSquared=Rsquared, full=FALSE)
## End(Not run)



