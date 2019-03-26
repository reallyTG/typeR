library(basictabler)


### Name: TableHtmlRenderer
### Title: A class that renders a table in HTML.
### Aliases: TableHtmlRenderer
### Keywords: datasets

### ** Examples

# This class should not be used by end users.  It is an internal class
# created only by the BasicTable class.  It is used when rendering to HTML.
# See the package vignettes for more information about outputs.
library(basictabler)
tbl <- qtbl(data.frame(a=1:2, b=3:4))
tbl$renderTable()



