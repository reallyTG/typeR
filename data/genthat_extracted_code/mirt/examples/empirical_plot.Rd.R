library(mirt)


### Name: empirical_plot
### Title: Function to generate empirical unidimensional item and test
###   plots
### Aliases: empirical_plot
### Keywords: empirical plots

### ** Examples


## Not run: 
##D 
##D SAT12[SAT12 == 8] <- NA
##D data <- key2binary(SAT12,
##D    key = c(1,4,5,2,3,1,2,1,3,1,2,4,2,1,5,3,4,4,1,4,3,3,4,1,3,5,1,3,1,5,4,5))
##D 
##D #test plot
##D empirical_plot(data)
##D 
##D #items 1, 2 and 5
##D empirical_plot(data, c(1, 2, 5))
##D empirical_plot(data, c(1, 2, 5), smooth = TRUE)
##D empirical_plot(data, c(1, 2, 5), boxplot = TRUE)
##D 
##D # replace weird looking items with unscored versions for diagnostics
##D empirical_plot(data, 32)
##D data[,32] <- SAT12[,32]
##D empirical_plot(data, 32)
##D empirical_plot(data, 32, smooth = TRUE)
##D 
## End(Not run)



