library(openxlsx)


### Name: setHeader
### Title: Set header for all worksheets
### Aliases: setHeader

### ** Examples

## Not run: 
##D wb <- createWorkbook("Edgar Anderson")
##D addWorksheet(wb, "S1")
##D writeDataTable(wb, "S1", x = iris[1:30,], xy = c("C", 5))
##D 
##D ## set all headers
##D setHeader(wb, "This is a header", position="center")
##D setHeader(wb, "To the left", position="left")
##D setHeader(wb, "On the right", position="right")
##D 
##D ## set all footers
##D setFooter(wb, "Center Footer Here", position="center")
##D setFooter(wb, "Bottom left", position="left")
##D setFooter(wb, Sys.Date(), position="right")
##D 
##D saveWorkbook(wb, "headerHeaderExample.xlsx", overwrite = TRUE)
## End(Not run)



