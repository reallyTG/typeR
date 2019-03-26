library(zooimage)


### Name: gui-utilities
### Title: Various GUI utility functions used by ZooImage
### Aliases: selectObject selectList selectFile selectGroups
###   createThreshold imageViewer startPgm modalAssistant
### Keywords: utilities

### ** Examples

## Not run: 
##D ## Create two datasets in R and ask for selecting one:
##D df1__ <- data.frame(x = 1:3, y = 4:6)
##D df2__ <- data.frame(z = 1:10)
##D selectObject() # Try also to click 'Cancel'
##D ## Can select both too
##D selectObject(multiple = TRUE, title = "Choose one or more data.frames")
##D selectObject("nonexistingclass") # Returns an empty string!
##D 
##D ## Create lists containing only data frames as components
##D lst1__ <- list(A = df1__, B = df2__)
##D lst2__ <- list(C = df1__)
##D selectList() # Try also to click 'Cancel'
##D ## Can select both too
##D selectList(multiple = TRUE, title = "Select one or more lists")
##D selectList("nonexistingclass")
##D rm(df1__, df2__, lst1__, lst2__)
##D 
##D ## Select one or more ZooImage files
##D selectFile() # One Zip or Zid file
##D 
##D ## Select groups to process
##D selectGroups(c("Copepods", "Appendicularians", "Medusae"))
##D 
##D ## Start default image viewer on the current working directory
##D imageViewer()
##D 
##D ## TODO: examples for createThreshold(), startPgm() and modalAssistant()
## End(Not run)



