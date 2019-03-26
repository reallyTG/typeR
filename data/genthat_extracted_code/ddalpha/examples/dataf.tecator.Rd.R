library(ddalpha)


### Name: dataf.tecator
### Title: Functional Data Set Spectrometric Data (Tecator)
### Aliases: dataf.tecator tecator
### Keywords: datasets functional

### ** Examples

## load the dataset
dataf = dataf.tecator()

## view the classes
unique(dataf$labels)

## access the 5th point of the 2nd object
dataf$dataf[[2]]$args[5]
dataf$dataf[[2]]$vals[5]

## plot the data
## Not run: 
##D labels = unlist(dataf$labels)
##D plot(dataf, 
##D   xlab="Wavelengths", ylab="Absorbances", 
##D   main=paste("Tecator: < 20 red (", sum(labels == "small"), "),", 
##D             " >= 20 blue (", sum(labels == "large"), ")", sep=""),
##D     colors = c("blue", "red"))
## End(Not run)



