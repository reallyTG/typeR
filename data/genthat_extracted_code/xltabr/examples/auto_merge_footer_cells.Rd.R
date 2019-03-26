library(xltabr)


### Name: auto_merge_footer_cells
### Title: Take a tab and merge the footer rows
### Aliases: auto_merge_footer_cells

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
tab <- add_body(tab, crosstab)
footer_text <- c("Footer contents 1", "Footer contents 2")
footer_style_names <- c("subtitle", "subtitle")
tab <- add_footer(tab, footer_text, footer_style_names)
tab <- auto_merge_footer_cells(tab)



