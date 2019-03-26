library(tablaxlsx)


### Name: bordear
### Title: Draw borders an area in an Excel sheet
### Aliases: bordear
### Keywords: table excel

### ** Examples

  ## Example
  require(openxlsx)
  wb=createWorkbook()
  addWorksheet(wb,"Primera")
  bordear(wb,"Primera",3,2,5,4)
  ##openXL(wb)
  
  ## Otro ejemplo
  wb=createWorkbook()
  addWorksheet(wb,"Primera")
  bordear(wb,"Primera",3,2,5,4,
          estilo=createStyle(border="bottomtop",borderColour=c("red","blue"),
                            borderStyle=c("double","thin")))
  ##openXL(wb)
  



