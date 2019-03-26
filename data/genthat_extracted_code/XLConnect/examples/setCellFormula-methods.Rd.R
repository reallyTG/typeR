library(XLConnect)


### Name: setCellFormula-methods
### Title: Setting cell formulas
### Aliases: setCellFormula setCellFormula-methods
###   setCellFormula,workbook,character-method
###   setCellFormula,workbook,numeric-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setCellFormula.xls", create = TRUE)

# Create a sheet named 'mtcars'
createSheet(wb, name = "mtcars")

# Create a named region called 'mtcars' referring to the sheet
# called 'mtcars'
createName(wb, name = "mtcars", formula = "mtcars!$A$1")

# Write built-in data set 'mtcars' to the above defined named region.
writeNamedRegion(wb, mtcars, name = "mtcars")

# Now, let us get Excel to calculate average weights.
# Where did we write the dataset?
corners <- getReferenceCoordinatesForName(wb, "mtcars")
# Put the average under the wt column
colIndex <- which(names(mtcars) == "wt") 
rowIndex <- corners[2,1] + 1

# Construct the input range & formula
input <- paste(idx2cref(c(corners[1,1], colIndex, 
                          corners[2,1], colIndex)), collapse=":")
formula <- paste("AVERAGE(", input, ")", sep="") 
            
setCellFormula(wb, "mtcars", rowIndex, colIndex, formula)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



