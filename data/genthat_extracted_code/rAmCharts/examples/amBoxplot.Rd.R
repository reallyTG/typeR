library(rAmCharts)


### Name: amBoxplot
### Title: Plotting boxplot using rAmCharts
### Aliases: amBoxplot amBoxplot.default amBoxplot.data.frame
###   amBoxplot.matrix amBoxplot.formula

### ** Examples


## Not run: 
##D # 'numeric' (default)
##D amBoxplot(rnorm(100))
##D 
##D # 'formula'
##D amBoxplot(count ~ spray, data = InsectSprays)
##D 
##D # 'formula', two group
##D data <- InsectSprays
##D data$group <- c("H", "F")
##D amBoxplot(count ~ spray + group, data = data, col = c("purple", "darkblue"))
##D 
##D # 'matrix'
##D x <- matrix(nrow = 10, ncol = 5, rnorm(50))
##D amBoxplot(x)
##D 
##D # 'data.frame'
##D amBoxplot(iris[, 1:4])
##D 
## End(Not run)
# Other examples available which can be time consuming depending on your configuration.

## No test: 
don <- data.frame(a = 1:10, b = 1:5)
amBoxplot(don, ylim = c(0,15))
## End(No test)
## No test: 
# --- matrix
x <- matrix(nrow = 10, ncol = 5, rnorm(50))

amBoxplot(x) # on columns
colnames(x) <- LETTERS[1:5]
amBoxplot(x) # with names
amBoxplot(x, use.cols = FALSE, col = c("blue", "red"))

# Parameter for amOptions
amBoxplot(x, export = TRUE, exportFormat = "SVG")
## End(No test)
## No test: 
# --- Formula
(obj <- amBoxplot(count ~ spray, data = InsectSprays))

# Adding parameters
amBoxplot(count ~ spray, data = InsectSprays, ylim = c(0,50),
          xlab = "spray", col = c("darkblue", "gray"))

# Transpose
amBoxplot(count ~ spray, data = InsectSprays, ylim = c(0,50), xlab = "spray", horiz = FALSE)

# Using a custom colum to identify outliers
InsectSprays$id <- paste0("ID : ", 1:nrow(InsectSprays))
amBoxplot(count ~ spray, data = InsectSprays, id = "id")

# Parameter for amOptions
amBoxplot(count ~ spray, data = InsectSprays, main = "amcharts")
## End(No test)



