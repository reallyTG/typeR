library(knitr)


### Name: kable
### Title: Create tables in LaTeX, HTML, Markdown and reStructuredText
### Aliases: kable

### ** Examples

kable(head(iris), format = "latex")
kable(head(iris), format = "html")
kable(head(iris), format = "latex", caption = "Title of the table")
kable(head(iris), format = "html", caption = "Title of the table")
# use the booktabs package
kable(mtcars, format = "latex", booktabs = TRUE)
# use the longtable package
kable(matrix(1000, ncol = 5), format = "latex", digits = 2, longtable = TRUE)
# change LaTeX default table environment
kable(head(iris), format = "latex", caption = "My table", table.envir = "table*")
# add some table attributes
kable(head(iris), format = "html", table.attr = "id=\"mytable\"")
# reST output
kable(head(mtcars), format = "rst")
# no row names
kable(head(mtcars), format = "rst", row.names = FALSE)
# R Markdown/Github Markdown tables
kable(head(mtcars[, 1:5]), format = "markdown")
# no inner padding
kable(head(mtcars), format = "markdown", padding = 0)
# more padding
kable(head(mtcars), format = "markdown", padding = 2)
# Pandoc tables
kable(head(mtcars), format = "pandoc", caption = "Title of the table")
# format numbers using , as decimal point, and ' as thousands separator
x = as.data.frame(matrix(rnorm(60, 1e+06, 10000), 10))
kable(x, format.args = list(decimal.mark = ",", big.mark = "'"))
# save the value
x = kable(mtcars, format = "html")
cat(x, sep = "\n")
# can also set options(knitr.table.format = 'html') so that the output is HTML



