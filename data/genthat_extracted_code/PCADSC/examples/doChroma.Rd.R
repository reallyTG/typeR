library(PCADSC)


### Name: doChroma
### Title: Compute chroma information
### Aliases: doChroma

### ** Examples

#load iris data
data(iris)

#Define grouping variable, grouping the observations by whether their species is
#Setosa or not
iris$group <- "setosa"
iris$group[iris$Species != "setosa"] <- "non-setosa"
iris$Species <- NULL

## Not run: 
##D #make a partial PCADSC object, splitting the data by "group"
##D irisPCADSC <- PCADSC(iris, "group", doChroma = FALSE)
##D 
##D #No chromaInfo available
##D irisPCADSC$chromaInfo
##D 
##D #Add and show chromaInfo
##D irisPCADSC <- doChroma(irisPCADSC)
##D irisPCADSC$chromaInfo
## End(Not run)

#Make a partial PCADSC object and only add chroma information for a
#faster runtime
irisPCADSC_fast <- PCADSC(iris, "group", doAngle = FALSE,
  doChroma = FALSE, doCE = FALSE)
irisPCADSC_fast <- doChroma(irisPCADSC_fast)
irisPCADSC_fast$chromaInfo




