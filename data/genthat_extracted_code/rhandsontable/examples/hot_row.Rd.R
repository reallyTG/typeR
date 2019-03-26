library(rhandsontable)


### Name: hot_row
### Title: Handsontable widget
### Aliases: hot_row

### ** Examples

library(rhandsontable)
MAT = matrix(rnorm(50), nrow = 10, dimnames = list(LETTERS[1:10],
             letters[1:5]))

rhandsontable(MAT, width = 300, height = 150) %>%
  hot_row(c(1,3:5), readOnly = TRUE)



