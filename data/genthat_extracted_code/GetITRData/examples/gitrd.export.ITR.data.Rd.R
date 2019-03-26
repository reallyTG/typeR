library(GetITRData)


### Name: gitrd.export.ITR.data
### Title: Export tibble to an excel file
### Aliases: gitrd.export.ITR.data

### ** Examples


# get example data from RData file
my.f <- system.file('extdata/ExampleReport_Petrobras.RData', package = 'GetITRData')
load(my.f)

## Not run: 
##D  # dontrun: keep cran check time short
##D gitrd.export.ITR.data(df.reports, base.file.name = 'MyExcelFile', format.data = 'wide')
## End(Not run)



