library(xlsx)


### Name: PrintSetup
### Title: Function to manipulate print setup.
### Aliases: printSetup PrintSetup

### ** Examples


wb <- createWorkbook()
sheet <- createSheet(wb, "Sheet1")
ps   <- printSetup(sheet, landscape=TRUE, copies=3)




