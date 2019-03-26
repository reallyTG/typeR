library(basictabler)


### Name: getTblTheme
### Title: Get a built-in theme for styling a table.
### Aliases: getTblTheme

### ** Examples

library(basictabler)
tbl <- qtbl(data.frame(a=1:2, b=3:4))
tbl$theme <- getTblTheme(tbl, "largeplain")
tbl$renderTable()



