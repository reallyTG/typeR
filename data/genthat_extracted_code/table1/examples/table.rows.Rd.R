library(table1)


### Name: table.rows
### Title: Convert to HTML table rows.
### Aliases: table.rows table.data
### Keywords: utilities

### ** Examples

x <- matrix(signif_pad(exp(rnorm(100, 1, 1))), 5, 5)
table.data(x)
cat(table.rows(x, NULL))
cat(table.rows(x, LETTERS[1:10]))
cat(table.rows(LETTERS[1:3], "Headings", th=TRUE))



