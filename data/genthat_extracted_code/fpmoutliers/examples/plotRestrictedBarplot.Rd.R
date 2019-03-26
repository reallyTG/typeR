library(fpmoutliers)


### Name: plotRestrictedBarplot
### Title: Plot of a restricted barplot with a highlighted selected value
### Aliases: plotRestrictedBarplot

### ** Examples

library("fpmoutliers")
data <- sample(1:1000, 1000, replace = TRUE)
selectedValue <- data[length(data)/2]
plotRestrictedBarplot(data, selectedValue, bars = 15,
     title=paste("Experimental=",selectedValue,sep=""))



