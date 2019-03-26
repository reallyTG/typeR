library(rAmCharts)


### Name: amPlot
### Title: Plot serial data
### Aliases: amPlot amPlot.default amPlot.numeric amPlot.character
###   amPlot.factor amPlot.data.frame amPlot.formula

### ** Examples


## Not run: 
##D # 'numeric':
##D amPlot(x = rnorm(100))
##D 
##D # add line
##D  amPlot(x = rnorm(100), type = 'sl', legend = T) %>>%
##D     amLines(x = rnorm(100), type = "p")
##D     
##D # 'character':
##D start <- as.POSIXct('01-01-2015', format = '%d-%m-%Y')
##D end <- as.POSIXct('31-12-2015', format = '%d-%m-%Y')
##D date <- seq.POSIXt(from = start, to = end, by = 'day')
##D date <- format(date, '%m-%d-%Y')
##D 
##D y <- rnorm(length(date))
##D amPlot(x = date, y = y, type = 'l', parseDates = TRUE, dataDateFormat = "MM-DD-YYYY")
##D # notice that by default 'parseDates = FALSE'
##D 
##D # 'data.frame'
##D amPlot(iris, col = colnames(iris)[1:2], type = c("l", "st"), zoom = TRUE, legend = TRUE)
##D 
##D # 'formula':
##D amPlot(Petal.Length + Sepal.Length ~ Sepal.Width, data = iris, legend = TRUE, zoom = TRUE)
## End(Not run)

## No test: 
# Other examples available which can be time consuming depending on your configuration.
library(data.table)

iris <- as.data.table(get("iris", "package:datasets"))
x <- rnorm(100)

# Simple scatter plot with title and color
# Also change type (set to "p" by default), avalaible "l", "sl", "st", "p", "b"
amPlot(x = x, main = "Title", col = "lightblue", type = "b")

x <- sort(rnorm(100))
y <- runif(100)
weights <- runif(100, 0, 15)
amPlot(x = x, y = y, weights = weights)
## End(No test)



