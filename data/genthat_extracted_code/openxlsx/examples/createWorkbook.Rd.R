library(openxlsx)


### Name: createWorkbook
### Title: Create a new Workbook object
### Aliases: createWorkbook

### ** Examples

## Create a new workbook
wb <- createWorkbook()

## Save workbook to working directory
saveWorkbook(wb, file = "createWorkbookExample.xlsx", overwrite = TRUE)

## Set Workbook properties
wb <- createWorkbook(creator = "Me"
, title = "title here"
, subject = "this & that"
, category = "something")




