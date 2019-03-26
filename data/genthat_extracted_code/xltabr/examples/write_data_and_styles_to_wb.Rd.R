library(xltabr)


### Name: write_data_and_styles_to_wb
### Title: Write the styles and data contained in tab object to the
###   workbook at tab$wb. This is useful if the user has prepared a tab
###   object, e.g. using auto_crosstab_to_tab maybe performed some
###   customisation, and now needs to write out to the workbook
### Aliases: write_data_and_styles_to_wb

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- auto_crosstab_to_tab(crosstab)
tab <- write_data_and_styles_to_wb(tab)



