library(DT)


### Name: tableHeader
### Title: Generate a table header or footer from column names
### Aliases: tableHeader tableFooter

### ** Examples

library(DT)
tableHeader(iris)  # or equivalently,
tableHeader(colnames(iris))
tableFooter(iris)  # footer

library(htmltools)
tags$table(tableHeader(iris), tableFooter(iris))



