library(dlmap)


### Name: dlmap
### Title: Perform DLMapping
### Aliases: dlmap plot.dlmap summary.dlmap profileplot profileplot.dlmap

### ** Examples

## Not run: 
##D data(BSdat)
##D data(BSphe)
##D 
##D # Convert cross object to DL Mapping format
##D dl.in1 <- dlcross(format="rqtl", genobj=BSdat, idname="ID", fixpos=1)
##D 
##D # Analyze data
##D BSdl <- dlmap(object=dl.in1, algorithm="lme", phename="phenotype", filestem="BS")
##D 
##D plot(BSdl)
##D 
##D # With additional phenotypic data
##D dl.in2 <- dlcross(format="rqtl", genobj=BSdat, pheobj=BSphe, idname="ID", step=5)
##D BSph <- dlmap(object=dl.in2, algorithm="asreml", phename="phenotype", env=TRUE, random=~Block)
##D 
##D profileplot(BSph)
##D summary(BSph)
## End(Not run)



