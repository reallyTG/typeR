library(openxlsx)


### Name: getDateOrigin
### Title: Get the date origin an xlsx file is using
### Aliases: getDateOrigin

### ** Examples


## create a file with some dates
write.xlsx(as.Date("2015-01-10") - (0:4), file = "getDateOriginExample.xlsx")
m <- read.xlsx("getDateOriginExample.xlsx")

## convert to dates
do <- getDateOrigin(system.file("readTest.xlsx", package = "openxlsx"))
convertToDate(m[[1]], do)




