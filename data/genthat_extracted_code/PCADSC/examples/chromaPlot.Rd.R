library(PCADSC)


### Name: chromaPlot
### Title: Chroma plot
### Aliases: chromaPlot

### ** Examples

#load iris data
data(iris)

#Define grouping variable, grouping the observations by whether their species is
#Setosa or not
iris$group <- "setosa"
iris$group[iris$Species != "setosa"] <- "non-setosa"
iris$Species <- NULL

## Not run: 
##D #make a PCADSC object, splitting the data by "group"
##D irisPCADSC <- PCADSC(iris, "group")
##D 
##D #make a partial PCADSC object from iris and fill out chromaInfo in the next call
##D irisPCADSC2 <- PCADSC(iris, "group", doChroma = FALSE)
##D irisPCADSC2 <- doChroma(irisPCADSC2)
##D 
##D #make a chroma plot
##D chromaPlot(irisPCADSC)
##D chromaPlot(irisPCADSC)
##D 
##D #Change the labels of the splitting variable
##D chromaPlot(irisPCADSC, splitLabels = list("non-setosa" = "Not Setosa",
##D     "setosa" = "Setosa"))
##D 
##D #Only plot components 1 and 4 and remove annotated variances
##D chromaPlot(irisPCADSC, useComps = c(1,4), varAnnotation = "no")
##D 
##D #Only plot the first components responsible for explaining 80 percent variance
##D chromaPlot(irisPCADSC, cvCO = 0.8)
##D 
##D #Change variable labels
##D chromaPlot(irisPCADSC, varLabels = c("Sepal length", "Sepal width", "Petal length",
##D    "Petal width"))
## End(Not run)

#Only do chroma information in order to get a faster runtime:
irisPCADSC_fast <- PCADSC(iris, "group", doCE = FALSE,
  doAngle = FALSE)
chromaPlot(irisPCADSC_fast)




