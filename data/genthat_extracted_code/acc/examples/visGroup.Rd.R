library(acc)


### Name: visGroup
### Title: Group level plots
### Aliases: visGroup
### Keywords: accelerometer

### ** Examples


##
## Example: A box plot
##
## Not run: 
##D library(acc)
##D data(NHANES)
##D NHANES_subset <- NHANES[1:300,]
##D visGroup(
##D data = NHANES_subset,
##D activity = 'wearTime',
##D ID = 'ID',
##D type = 'boxplot',
##D title = "Wear time at baseline",
##D yaxis = "Wear time (minutes per day)",xaxis=TRUE)
##D 
##D 
##D ##
##D ## Example: A heatmap
##D ##
##D library(acc)
##D data(NHANES)
##D NHANES_subset <- NHANES[1:1000,]
##D 
##D visGroup(
##D data = NHANES_subset,
##D ID = 'ID',activity = 'wearTime',
##D type = 'heatmap',title = "Wear time at baseline",
##D yaxis = "ID",time = 'Day',
##D legendTitle = "Wear time",
##D groupBy = 'VO2max',groupFun = 'median',
##D levels = c(0,300,600,1440),
##D heatcol = c("white","mistyrose","lightpink","violetred1"))
## End(Not run)



