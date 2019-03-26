library(PCADSC)


### Name: doCE
### Title: Compute cumulative eigenvalue information
### Aliases: doCE

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
##D irisPCADSC <- PCADSC(iris, "group", doCE = FALSE)
##D 
##D #No CEInfo available
##D irisPCADSC$CEInfo
##D 
##D #Add and show CEInfo
##D irisPCADSC <- doCE(irisPCADSC)
##D irisPCADSC$CEInfo
## End(Not run)

#Make a partial PCADSC object and only add CE information with no
#bootstrapping (and thus no test)
irisPCADSC_fast <- PCADSC(iris, "group", doAngle = FALSE,
  doChroma = FALSE, doCE = FALSE)
irisPCADSC_fast <- doCE(irisPCADSC_fast, B = 100)
irisPCADSC_fast$CEInfo




