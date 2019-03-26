library(imageData)


### Name: longiPlot
### Title: Plots longitudinal data from a Lemna Tec Scananalyzer
### Aliases: longiPlot
### Keywords: hplot

### ** Examples

data(exampleData)
longiPlot(data = longi.dat, response = "Area.smooth")

plt <- longiPlot(data = longi.dat, response = "Area.smooth", x.title = "DAP",  
                 y.title = "Area.smooth", x="xDays+35.42857143", printPlot=FALSE)
plt <- plt + ggplot2::geom_vline(xintercept=29, linetype="longdash", size=1) +
             ggplot2::scale_x_continuous(breaks=seq(28, 42, by=2)) + 
             ggplot2::scale_y_continuous(limits=c(0,750))
print(plt)

longiPlot(data = longi.dat, response = "Area.smooth", x.title = "DAP",  
          y.title = "Area.smooth", x="xDays+35.42857143", 
          ggplotFuncs = list(ggplot2::geom_vline(xintercept=29, linetype="longdash", 
                                                 size=1), 
                             ggplot2::scale_x_continuous(breaks=seq(28, 42, by=2)), 
                             ggplot2::scale_y_continuous(limits=c(0,750))))



