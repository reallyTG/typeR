library(spTimer)


### Name: spT.subset
### Title: Select a subset of Spatial data.
### Aliases: spT.subset
### Keywords: utility

### ** Examples

##

# Load ozone concentration data for New York.
data(NYdata)	
NYdata	
# Choose sites 2, 8, and 12.
subdata<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(2,8,12))
# Do not choose purposively defined sites numbered as 2, 8, and 12.
subdata<-spT.subset(data=NYdata, var.name=c("s.index"), s=c(2,8,12), reverse=TRUE)
   
##



