library(PCADSC)


### Name: CEPlot
### Title: Cumulative eigenvalue plot
### Aliases: CEPlot

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
##D #make a partial PCADSC object from iris and fill out CEInfo in the next call
##D irisPCADSC2 <- PCADSC(iris, "group", doCE = FALSE)
##D irisPCADSC2 <- doCE(irisPCADSC2)
##D 
##D #make a CE plot
##D CEPlot(irisPCADSC)
##D CEPlot(irisPCADSC2)
## End(Not run)

#Only do CE information and use less resamplings for a faster runtime
irisPCADSC_fast <- PCADSC(iris, "group", doAngle = FALSE, doChroma = FALSE,
  B = 1000)
CEPlot(irisPCADSC_fast)




