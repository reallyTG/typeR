library(XLConnect)


### Name: writeNamedRegionToFile
### Title: Writing named regions to an Excel file (wrapper function)
### Aliases: writeNamedRegionToFile
### Keywords: IO

### ** Examples

# multiregion xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx", 
                             package = "XLConnect")

template <- "template-ws.xlsx"
file.copy(demoExcelFile, template) 

# Write single data.frame to a named region in an existing file
writeNamedRegionToFile(template, name = "Iris", iris)

# Write to a new file, defining the sheet and named region as we write.
# Format according to XLConnect defaults
writeNamedRegionToFile("iris.xlsx", name = "Iris", data = iris,
                       formula = "IrisData!$C$4", 
                       styleAction = "XLCONNECT")



