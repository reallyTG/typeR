library(xltabr)


### Name: add_title
### Title: Add titles to the tab.  Title text is provided as a character
###   vector, with each element being a row of the title
### Aliases: add_title

### ** Examples

crosstab <- read.csv(system.file("extdata", "example_crosstab.csv", package="xltabr"))
tab <- initialise()
title_text <- c("Main title on first row", "subtitle on second row")
title_style_names <- c("title", "subtitle")
tab <- add_title(tab, title_text, title_style_names)



