library(officer)


### Name: sheet_select
### Title: select sheet
### Aliases: sheet_select

### ** Examples

my_ws <- read_xlsx()
my_pres <- add_sheet(my_ws, label = "new sheet")
my_pres <- sheet_select(my_ws, sheet = "new sheet")
print(my_ws, target = tempfile(fileext = ".xlsx") )



