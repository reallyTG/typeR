library(surveillance)


### Name: ha
### Title: Hepatitis A in Berlin
### Aliases: ha ha.sts
### Keywords: datasets

### ** Examples

## deprecated "disProg" object
data("ha")
ha
plot(aggregate(ha))

## new-style "sts" object
data("ha.sts")
ha.sts
plot(ha.sts, type = observed ~ unit, labels = TRUE)

## conversion of the old "disProg" object 'ha' to the new S4 class "sts"
## Not run: 
##D shpfile <- system.file("shapes/berlin.shp", package="surveillance")
##D ha.sts <- disProg2sts(ha, map = maptools::readShapePoly(shpfile,IDvar="SNAME"))
##D ## in data("ha.sts"), German umlauts in 'ha.sts@map@data$BEZIRK'
##D ## have been replaced for compatibility
## End(Not run)



