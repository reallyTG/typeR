library(classInt)


### Name: findCols
### Title: extract classes from classInterval object
### Aliases: findCols
### Keywords: spatial

### ** Examples

data(jenks71, package="spData")
fix5 <- classIntervals(jenks71$jenks71, n=5, style="fixed",
 fixedBreaks=c(15.57, 25, 50, 75, 100, 155.30))
fix5
findCols(fix5)



