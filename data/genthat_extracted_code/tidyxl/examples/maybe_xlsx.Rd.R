library(tidyxl)


### Name: maybe_xlsx
### Title: Determine file format
### Aliases: maybe_xlsx

### ** Examples

examples_xlsx <- system.file("extdata/examples.xlsx", package = "tidyxl")
examples_xlsm <- system.file("extdata/examples.xlsm", package = "tidyxl")
examples_xltx <- system.file("extdata/examples.xltx", package = "tidyxl")
examples_xltm <- system.file("extdata/examples.xltm", package = "tidyxl")
examples_xlsb <- system.file("extdata/examples.xlsb", package = "tidyxl")
examples_xls <- system.file("extdata/examples.xls", package = "tidyxl")

maybe_xlsx(examples_xlsx)
maybe_xlsx(examples_xlsm)
maybe_xlsx(examples_xltx)
maybe_xlsx(examples_xltm)
maybe_xlsx(examples_xlsb)
maybe_xlsx(examples_xls)



