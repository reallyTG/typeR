library(PCADSC)


### Name: doAngle
### Title: Compute angle information
### Aliases: doAngle

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
##D irisPCADSC <- PCADSC(iris, "group", doAngle = FALSE)
##D 
##D #No angleInfo available
##D irisPCADSC$angleInfo
##D 
##D #Add and show angleInfo
##D irisPCADSC <- doAngle(irisPCADSC)
##D irisPCADSC$angleInfo
## End(Not run)

#Make a partial PCADSC object and only add angle information for a
#faster runtime
irisPCADSC_fast <- PCADSC(iris, "group", doAngle = FALSE,
  doChroma = FALSE, doCE = FALSE)
irisPCADSC_fast <- doAngle(irisPCADSC_fast)
irisPCADSC_fast$angleInfo




