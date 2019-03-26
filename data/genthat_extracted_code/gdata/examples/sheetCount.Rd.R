library(gdata)


### Name: sheetCount
### Title: Count or list sheet names in Excel spreadsheet files.
### Aliases: sheetCount sheetNames
### Keywords: misc

### ** Examples

   xlsfile <- system.file("xls", "iris.xls", package = "gdata")
   xlsfile

   sheetCount(xlsfile)


   exampleFile <- file.path(path.package('gdata'),'xls',
                            'ExampleExcelFile.xls')
   exampleFile2007 <- file.path(path.package('gdata'),'xls',
                            'ExampleExcelFile.xlsx')

   sheetCount(exampleFile)

   if( 'XLSX' %in% xlsFormats() )  # if XLSX is supported..
     sheetNames(exampleFile2007)





