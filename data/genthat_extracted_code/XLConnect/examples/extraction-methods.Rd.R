library(XLConnect)


### Name: extraction-methods
### Title: Workbook data extraction & replacement operators
### Aliases: [ [[ [<- [[<- [-methods [[-methods [<--methods [[<--methods
###   [,workbook-method [[,workbook-method [<-,workbook-method
###   [[<-,workbook-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("extraction.xlsx", create = TRUE)

# Write mtcars data set on a worksheet named 'mtcars1'.
# Note: The 'mtcars1' sheet will be created automatically if it does
# not exist yet. Also, default values for other writeWorksheet arguments
# hold, i.e. the data set is written starting at the top left corner. 
wb["mtcars1"] = mtcars

# Write mtcars data set on a worksheet named 'mtcars2'.
# Again, the 'mtcars2' worksheet is created automatically.
# Additionally specify arguments passed to the underlying method
# writeWorksheet.
wb["mtcars2", startRow = 6, startCol = 11, header = FALSE] = mtcars

# Read worksheets 'mtcars1' and 'mtcars2'.
# Note: The default arguments hold for the underlying method
# readWorksheet.
wb["mtcars1"]
wb["mtcars2"]

# Write mtcars data set to a named region named 'mtcars3'. Since
# it doesn't exist yet we also need to specify the formula to
# define it. Also note that the sheet 'mtcars3' referenced in the
# formula does not yet exist - it will be created automatically!
# Moreover, default values for other writeNamedRegion arguments hold.
wb[["mtcars3", "mtcars3!$B$7"]] = mtcars

# Redefine named region 'mtcars3'. Note that no formula specification
# is required since named region is already defined (see above example).
wb[["mtcars3"]] = mtcars

# Write mtcars data set to a named region 'mtcars4'. Since the named
# region does not yet exist a formula specification is required. Also,
# additional arguments are specified that are passed to the underlying
# method writeNamedRegion.
wb[["mtcars4", "mtcars4!$D$8", rownames = "Car"]] = mtcars

# Read the named regions 'mtcars3' and 'mtcars4'.
# Note: Default values hold for the underlying method readNamedRegion.
wb[["mtcars3"]]
wb[["mtcars4"]]



