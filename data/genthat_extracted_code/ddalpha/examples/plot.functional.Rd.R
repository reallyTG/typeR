library(ddalpha)


### Name: plot.functional
### Title: Plot functions for the Functional Data
### Aliases: plot.functional lines.functional points.functional
### Keywords: visualization functional

### ** Examples


## Not run: 
##D   ## load the Growth dataset
##D   dataf = dataf.growth()
##D   
##D   labels = unlist(dataf$labels)
##D   plot(dataf, 
##D        main = paste("Growth: girls red (", sum(labels == "girl"), "),", 
##D                     " boys blue (", sum(labels == "boy"), ")", sep=""),
##D        xlab="Year", ylab="Height, cm",
##D        colors = c("blue", "red")   # in alphabetical order of class labels   
##D   )
##D   
##D   # plot an observation as a line
##D   observation = structure(list(dataf = list(dataf$dataf[[1]])), class = "functional")
##D   lines(observation, colors = "green", lwd = 3)
##D   
##D   # plot hight at the age of 14 
##D   indexAge14 = which(observation$dataf[[1]]$args == 14)
##D   hightAge14 = observation$dataf[[1]]$vals[indexAge14]
##D   atAge14 = structure(list(
##D                       dataf = list(dataf = list(args = 14, vals = hightAge14))
##D                       ), class = "functional")
##D   points(atAge14, colors = "yellow", pch = 18)
## End(Not run)




