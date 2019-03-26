library(SortableHTMLTables)


### Name: SortableHTMLTables-package
### Title: Turns a data frame into an HTML file containing a sortable
###   table.
### Aliases: SortableHTMLTables-package SortableHTMLTables
### Keywords: package

### ** Examples

library('SortableHTMLTables')

df <- data.frame(X = rnorm(10), Y = runif(10), Z = rcauchy(10))

sortable.html.table(df, 'sample.html')



