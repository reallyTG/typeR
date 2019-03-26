library(Laterality)


### Name: laterhist
### Title: laterhist: this function plots an histogram of the different
###   type of grasp (Left, right, bimanual...) for each kind of activity.
### Aliases: laterhist
### Keywords: HI handedness index zscore laterality manual preference

### ** Examples

  ## With arguments corresponding to the default ones:
  data(laterdata)
  str(laterdata)
  Data<-laterdata
  laterhist(Data, catch ="Food", hand="Hand", 
  legend.text = TRUE, legendlocation = FALSE)
  ## or
  laterhist(Data, legend.text = TRUE, legendlocation = FALSE)
  
  ## With arguments different from the default ones:
  data(lateradata)
  str(lateradata)
  Data<-lateradata
  laterhist(Data, catch ="Act", hand="HandPref", legend.text = TRUE, legendlocation = FALSE)



