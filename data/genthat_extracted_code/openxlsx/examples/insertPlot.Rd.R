library(openxlsx)


### Name: insertPlot
### Title: Insert the current plot into a worksheet
### Aliases: insertPlot

### ** Examples

## Not run: 
##D ## Create a new workbook
##D wb <- createWorkbook()
##D 
##D ## Add a worksheet
##D addWorksheet(wb, "Sheet 1", gridLines = FALSE) 
##D 
##D ## create plot objects
##D require(ggplot2)
##D p1 <- qplot(mpg, data=mtcars, geom="density",
##D   fill=as.factor(gear), alpha=I(.5), main="Distribution of Gas Mileage")
##D p2 <- qplot(age, circumference,
##D   data = Orange, geom = c("point", "line"), colour = Tree)
##D 
##D ## Insert currently displayed plot to sheet 1, row 1, column 1
##D print(p1) #plot needs to be showing
##D insertPlot(wb, 1, width = 5, height = 3.5, fileType = "png", units = "in")
##D 
##D ## Insert plot 2
##D print(p2)
##D insertPlot(wb, 1, xy = c("J", 2), width = 16, height = 10,  fileType = "png", units = "cm")
##D 
##D ## Save workbook
##D saveWorkbook(wb, "insertPlotExample.xlsx", overwrite = TRUE)
## End(Not run)



