library(xlsimple)


### Name: saveXLworkbook
### Title: Save Excel Workbook to disk
### Aliases: saveXLworkbook

### ** Examples

XL.wb <- getXLsettings()
XL.wb <- addXLsheetStd(XL.wb, mtcars)
XL.wb <- addXLsheetStd(XL.wb, mtcars, "mtcars1")
XL.wb <- addXLsheetStd(XL.wb, mtcars, "mtcars2", "Standard mtcars data frame")
XL.wb$pName <- "ProjName" # optional, blank if not included
XL.wb$pDesc <- "ProjDesc" # optional, blank if not included
saveXLworkbook(XL.wb, 'myXLfile.xlsx', timeStamp=FALSE, clean=FALSE)
saveXLworkbook(XL.wb, 'myXLfile.xlsx', timeStamp=TRUE,  clean=FALSE)
saveXLworkbook(XL.wb, 'myXLfile.xlsx', timeStamp=TRUE,  clean=TRUE)
saveXLworkbook(XL.wb, 'myXLfile.xlsx')



