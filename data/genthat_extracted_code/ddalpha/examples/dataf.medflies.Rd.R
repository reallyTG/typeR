library(ddalpha)


### Name: dataf.medflies
### Title: Relationship of Age Patterns of Fecundity to Mortality for
###   Female Medflies.
### Aliases: dataf.medflies medflies
### Keywords: datasets functional

### ** Examples

## load the dataset
dataf = dataf.medflies()

## view the classes
unique(dataf$labels)

## access the 5th point of the 2nd object
dataf$dataf[[2]]$args[5]
dataf$dataf[[2]]$vals[5]

## plot the data
## Not run: 
##D labels = unlist(dataf$labels)
##D plot(dataf,
##D   xlab="Day", ylab="# eggs", 
##D   main=paste("Medflies (training time):\n short-lived red (", sum(labels == "short-lived"), "),", 
##D                     " long-lived blue (", sum(labels == "long-lived"), ")", sep=""),
##D   colors = c("blue", "red")   # in alphabetical order of class labels
##D   )
##D 
## End(Not run)



