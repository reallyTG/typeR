library(xts)


### Name: addEventLines
### Title: Add vertical lines to an existing xts plot
### Aliases: addEventLines

### ** Examples

## Not run: 
##D library(xts)
##D data(sample_matrix)
##D sample.xts <- as.xts(sample_matrix)
##D events <- xts(letters[1:3], 
##D               as.Date(c("2007-01-12", "2007-04-22", "2007-06-13")))
##D plot(sample.xts[,4])
##D addEventLines(events, srt=90, pos=2)
## End(Not run)



