library(ddalpha)


### Name: dataf.growth
### Title: Berkeley Growth Study Data
### Aliases: dataf.growth growth
### Keywords: datasets functional

### ** Examples

## load the Growth dataset
dataf = dataf.growth()

## view the classes
unique(dataf$labels)

## access the 5th point of the 2nd object
dataf$dataf[[2]]$args[5]
dataf$dataf[[2]]$vals[5]

## plot the data
## Not run: 
##D   labels = unlist(dataf$labels)
##D   plot(dataf, 
##D     main = paste("Growth: girls red (", sum(labels == "girl"), "),", 
##D                       " boys blue (", sum(labels == "boy"), ")", sep=""),
##D     xlab="Year", ylab="Height, cm",
##D     colors = c("blue", "red")   # in alphabetical order of class labels   
##D     )
## End(Not run)



