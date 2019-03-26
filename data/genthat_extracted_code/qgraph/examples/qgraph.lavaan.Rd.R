library(qgraph)


### Name: qgraph.lavaan
### Title: qgraph: Structural Equation Modelling
### Aliases: qgraph.lavaan
### Keywords: lavaan cfa SEM path diagram graph qgraph

### ** Examples

## Not run: 
##D ## The industrialization and Political Democracy Example 
##D # Example from lavaan::sem help file:
##D require("lavaan")
##D      ## Bollen (1989), page 332
##D      model <- ' 
##D        # latent variable definitions
##D           ind60 =~ x1 + x2 + x3
##D           dem60 =~ y1 + y2 + y3 + y4
##D           dem65 =~ y5 + equal("dem60=~y2")*y6 
##D                       + equal("dem60=~y3")*y7 
##D                       + equal("dem60=~y4")*y8
##D      
##D        # regressions
##D          dem60 ~ ind60
##D          dem65 ~ ind60 + dem60
##D      
##D        # residual correlations
##D          y1 ~~ y5
##D          y2 ~~ y4 + y6
##D          y3 ~~ y7
##D          y4 ~~ y8
##D          y6 ~~ y8
##D      '
##D      
##D      fit <- sem(model, data=PoliticalDemocracy)
##D 
##D # Plot standardized model (numerical):
##D qgraph.lavaan(fit,layout="tree",vsize.man=5,vsize.lat=10,
##D 	filetype="",include=4,curve=-0.4,edge.label.cex=0.6)
##D 
##D # Plot standardized model (graphical):
##D qgraph.lavaan(fit,layout="tree",vsize.man=5,vsize.lat=10,
##D 	filetype="",include=8,curve=-0.4,edge.label.cex=0.6)
##D 
##D # Create output document:
##D qgraph.lavaan(fit,layout="spring",vsize.man=5,vsize.lat=10,
##D 	filename="lavaan")
##D 
## End(Not run)



