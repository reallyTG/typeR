library(rAmCharts)


### Name: amLines
### Title: amLines adds a serie to a graph.
### Aliases: amLines

### ** Examples

require(pipeR)
amPlot(x = rnorm(100), type = 'sl') %>>%
  amLines(x = rnorm(100), type = "p")
  
## No test: 
amPlot(x = rnorm(100), type = 'sl') %>>%
  amLines(x = rnorm(100), col = "blue") %>>%
  amLines(x = rnorm(100), type = "sl") %>>%
  amLines(x = rnorm(100), type = "p")

# For an XY chart
x <- sort(rnorm(100))
y1 <- rnorm(100, sd = 10)
y2 <- rnorm(100, sd = 10)
y3 <- rnorm(100, sd = 10)
amPlot(x = x, y = y1) %>>%
  amLines(x = y2, col = "blue") %>>%
  amLines(x = y3, type = "p")
## End(No test)




