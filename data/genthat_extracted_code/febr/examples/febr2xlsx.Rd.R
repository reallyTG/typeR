library(febr)


### Name: febr2xlsx
### Title: Write data to an Excel workbook
### Aliases: febr2xlsx

### ** Examples

## No test: 
dts <-
  febr::febr(dataset = "ctb0013", 
             variable = "all",
             merge = TRUE,
             progress = FALSE, verbose = FALSE)
febr2xlsx(x = dts, file = tempfile(fileext = ".xlsx"))
## End(No test)



