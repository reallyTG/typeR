library(CHCN)


### Name: CHCN-package
### Title: A package for Building Historical Climate data for Canada
### Aliases: CHCN-package CHCN
### Keywords: package

### ** Examples

## Not run: 
##D      downloadMaster()
##D      Stations <- writeMonthlyStations()
##D      scrapeToCsv(Stations)
##D      EMPTY <- getEmptyCsv()
##D      if (is.null(EMPTY)){
##D          data <- createDataset()
##D          ###  save all the data
##D          writeData(data)
##D          inv  <- createInventory()
##D          write.table(inv,"masterInventory.inv")
##D          # write a ghcn style inventory
##D          writeInventory(inv)
##D          # select Tave data
##D          Mean <- formatGhcn(data, dataColumn = 7)
##D          writeGhcn(Mean)
##D  
##D } else{
##D   scrapeToCsv(EMPTY)
##D }
##D 
## End(Not run)
 



