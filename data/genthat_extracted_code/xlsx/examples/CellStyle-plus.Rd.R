library(xlsx)


### Name: "+.CellStyle"
### Title: CellStyle construction.
### Aliases: +.CellStyle

### ** Examples

## Not run: 
##D   cs <- CellStyle(wb) +
##D     Font(wb, heightInPoints=20, isBold=TRUE, isItalic=TRUE,
##D       name="Courier New", color="orange") + 
##D     Fill(backgroundColor="lavender", foregroundColor="lavender",
##D       pattern="SOLID_FOREGROUND") +
##D     Alignment(h="ALIGN_RIGHT")
##D    
##D   setCellStyle(cell.1, cellStyle1)  
##D 
##D   # you need to save the workbook now if you want to see this art
## End(Not run)



