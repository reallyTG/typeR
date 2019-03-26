library(PCADSC)


### Name: anglePlot
### Title: Angle plot
### Aliases: anglePlot

### ** Examples

#load iris data
data(iris)

#Define grouping variable, grouping the observations by whether their species is
#Setosa or not
iris$group <- "setosa"
iris$group[iris$Species != "setosa"] <- "non-setosa"
iris$Species <- NULL

## Not run: 
##D #make a full PCADSC object, splitting the data by "group"
##D irisPCADSC <- PCADSC(iris, "group")
##D 
##D #make a partial PCADSC object from iris and fill out angleInfo in the next call
##D irisPCADSC2 <- PCADSC(iris, "group", doAngle = FALSE)
##D irisPCADSC2 <- doAngle(irisPCADSC2)
##D 
##D #make an angle plot
##D anglePlot(irisPCADSC)
##D anglePlot(irisPCADSC2)
## End(Not run)

#Only do angle information for a faster run-time
irisPCADSC_fast <- PCADSC(iris, "group", doCE = FALSE, doChroma = FALSE)
anglePlot(irisPCADSC_fast)




