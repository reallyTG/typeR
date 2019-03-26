library(ifultools)


### Name: stackPlot
### Title: Stack plot
### Aliases: stackPlot
### Keywords: hplot

### ** Examples

## stack-plot the sunspots series and a random 
## walk series 
set.seed(100)
ix <- seq(2048)
stackPlot(x=ix,
    y=data.frame(sunspots[ix], cumsum(rnorm(length(ix)))),
    xlty=2, ylab=list(text=c("sunspots","walk")))



