library(casebase)


### Name: plot.popTime
### Title: Population Time Plot
### Aliases: plot.popTime plot.popTimeExposure popTime checkArgsTimeEvent

### ** Examples

## Not run: 
##D data(bmtccr)
##D popTimeData <- popTime(data = bmtccr, time = "ftime", exposure = "D")
##D # p is an object of class gg and ggplot
##D p <- plot(popTimeData)
##D # you can further modify the object using all ggplot2 functions
##D # here we modify the number of y-tick labels
##D p + scale_y_continuous(breaks = seq(0, max(popTimeData$data$ycoord), 10))
## End(Not run)



