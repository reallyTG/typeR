library(XLConnect)


### Name: xlcRestore
### Title: Restoring objects from Excel files
### Aliases: xlcRestore
### Keywords: utilities file

### ** Examples

require(datasets)
xlcDump(c("airquality", "CO2", "iris", "PlantGrowth", "swiss"),
        file = "myDump.xlsx", pos = "package:datasets")
xlcRestore(file = "myDump.xlsx", overwrite = TRUE)



