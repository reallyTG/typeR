library(plotrix)


### Name: addtable2plot
### Title: Add a table of values to a plot
### Aliases: addtable2plot
### Keywords: misc

### ** Examples

 testdf <- data.frame(Before = c(10, 7, 5, 9), During = c(8, 6, 2, 5),
  After = c(5, 3, 4, 3))
 rownames(testdf) <- c("Red", "Green", "Blue", "Lightblue")
 barp(testdf, main = "Test addtable2plot", ylab = "Value",
  names.arg = colnames(testdf), col = 2:5)
 # show most of the options including the christmas tree colors
 abg <- matrix(c(2, 3, 5, 6, 7, 8), nrow=4, ncol=3)
 addtable2plot(2, 8, testdf, bty = "o", display.rownames = TRUE, hlines = TRUE,
  vlines = TRUE, title = "The table", bg = abg)



