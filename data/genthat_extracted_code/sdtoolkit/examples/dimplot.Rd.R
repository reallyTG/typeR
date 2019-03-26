library(sdtoolkit)


### Name: dimplot
### Title: Plot normalized dimension restrictions as horizontal bars
### Aliases: dimplot
### Keywords: robust tree

### ** Examples

#Load an example box object
data(exboxes)

#Plot the first box with only the restricted dimensions shown:
dimplot(exboxes, 1)

#Plot the second box showing all the dimensions, whether or not
#they are restricted:
dimplot(exboxes, 2, alldims=TRUE)



