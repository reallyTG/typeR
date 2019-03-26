library(xlsx)


### Name: addDataFrame
### Title: Add a 'data.frame' to a sheet.
### Aliases: addDataFrame

### ** Examples


  wb <- createWorkbook()
  sheet  <- createSheet(wb, sheetName="addDataFrame1")
  data <- data.frame(mon=month.abb[1:10], day=1:10, year=2000:2009,
    date=seq(as.Date("1999-01-01"), by="1 year", length.out=10),
    bool=c(TRUE, FALSE), log=log(1:10),
    rnorm=10000*rnorm(10),
    datetime=seq(as.POSIXct("2011-11-06 00:00:00", tz="GMT"), by="1 hour",
      length.out=10))
  cs1 <- CellStyle(wb) + Font(wb, isItalic=TRUE)           # rowcolumns
  cs2 <- CellStyle(wb) + Font(wb, color="blue")
  cs3 <- CellStyle(wb) + Font(wb, isBold=TRUE) + Border()  # header
  addDataFrame(data, sheet, startRow=3, startColumn=2, colnamesStyle=cs3,
    rownamesStyle=cs1, colStyle=list(`2`=cs2, `3`=cs2))

  # to change the default date format use something like this
  # options(xlsx.date.format="dd MMM, yyyy")


  # Don't forget to save the workbook ...  
  # saveWorkbook(wb, file) 



