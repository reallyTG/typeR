library(XLConnect)


### Name: readNamedRegionFromFile
### Title: Reading named regions from an Excel file (wrapper function)
### Aliases: readNamedRegionFromFile
### Keywords: IO

### ** Examples

# multiregion xlsx file from demoFiles subfolder of package XLConnect
demoExcelFile <- system.file("demoFiles/multiregion.xlsx", 
                             package = "XLConnect")
                             
# Load a single named region into a single data.frame.
df <- readNamedRegionFromFile(demoExcelFile, name="Iris")

# Load multiple regions at once - returns a (named) list 
# of data.frames.
df <- readNamedRegionFromFile(demoExcelFile, 
                              name=c("Calendar", "Iris", "IQ"))



