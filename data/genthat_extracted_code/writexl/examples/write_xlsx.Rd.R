library(writexl)


### Name: write_xlsx
### Title: Export to xlsx
### Aliases: write_xlsx writexl

### ** Examples

# Roundtrip example with single excel sheet named 'mysheet'
tmp <- write_xlsx(list(mysheet = iris))
readxl::read_xlsx(tmp)



