library(ETLUtils)


### Name: renameColumns
### Title: Renames variables in a data frame.
### Aliases: renameColumns

### ** Examples

x <- data.frame(x = 1:4, y = LETTERS[1:4])
renameColumns(x, from = c("x","y"), to = c("digits","letters"))



