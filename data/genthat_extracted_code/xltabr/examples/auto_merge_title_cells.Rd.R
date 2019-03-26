library(xltabr)


### Name: auto_merge_title_cells
### Title: Take a tab and merge the title rows
### Aliases: auto_merge_title_cells

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
tab <- add_body(tab, crosstab)
title_text <- c("Main title on first row", "subtitle on second row")
title_style_names <- c("title", "subtitle")
tab <- add_title(tab, title_text, title_style_names)
tab <- auto_merge_title_cells(tab)



