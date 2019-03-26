library(rhandsontable)


### Name: hot_rows
### Title: Handsontable widget
### Aliases: hot_rows

### ** Examples

library(rhandsontable)
MAT = matrix(rnorm(50), nrow = 10, dimnames = list(LETTERS[1:10],
             letters[1:5]))

rhandsontable(MAT, width = 300, height = 150) %>%
  hot_cols(colWidths = 100, fixedColumnsLeft = 1) %>%
  hot_rows(rowHeights = 50, fixedRowsTop = 1)



