library(tidyxl)


### Name: xlsx_validation
### Title: Import data validation rules of cells in xlsx (Excel) files
### Aliases: xlsx_validation

### ** Examples

examples <- system.file("extdata/examples.xlsx", package = "tidyxl")
xlsx_validation(examples)
xlsx_validation(examples, 1)
xlsx_validation(examples, "Sheet1")



