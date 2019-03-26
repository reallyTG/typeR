library(SortableHTMLTables)


### Name: sortable.html.table
### Title: Write a data frame as an HTML file containing a sortable table.
### Aliases: sortable.html.table

### ** Examples

library('SortableHTMLTables')

df <- data.frame(X = rnorm(10), Y = runif(10), Z = rcauchy(10))

sortable.html.table(df, 'sample.html')



