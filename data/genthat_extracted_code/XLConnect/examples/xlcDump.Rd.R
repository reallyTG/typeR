library(XLConnect)


### Name: xlcDump
### Title: Dumping data sets to Excel files
### Aliases: xlcDump
### Keywords: utilities file

### ** Examples

require(datasets)
xlcDump(c("airquality", "CO2", "iris", "PlantGrowth", "swiss"),
        file = "myDump.xlsx", pos = "package:datasets")
xlcRestore(file = "myDump.xlsx", overwrite = TRUE)



