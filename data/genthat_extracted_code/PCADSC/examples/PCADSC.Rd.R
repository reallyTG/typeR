library(PCADSC)


### Name: PCADSC
### Title: Compute the elements used for PCADSC
### Aliases: PCADSC

### ** Examples

#load iris data
data(iris)

#Define grouping variable, grouping the observations by whether their species is
#Setosa or not
iris$group <- "setosa"
iris$group[iris$Species != "setosa"] <- "non-setosa"
iris$Species <- NULL

## Not run: 
##D #Make a full PCADSC object, splitting the data by "group"
##D irisPCADSC <- PCADSC(iris, "group")
##D 
##D #The three plotting functions can now be called on irisPCADSC:
##D CEPlot(irisPCADSC)
##D anglePlot(irisPCADSC)
##D chromaPlot(irisPCADSC)
##D 
##D #Make a partial PCADSC object with no angle plot information and add
##D #angle plot information afterwards:
##D irisPCADSC2 <- PCADSC(iris, "group", doAngle = FALSE)
##D irisPCADSC2 <- doAngle(irisPCADSC)
## End(Not run)

#Make a partial PCADSC obejct with no plotting (angle/CE/chroma)
#information:
irisPCADSC_minimal <- PCADSC(iris, "group", doAngle = FALSE,
  doCE = FALSE, doChroma = FALSE)




