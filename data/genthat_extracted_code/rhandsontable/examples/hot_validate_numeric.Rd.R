library(rhandsontable)


### Name: hot_validate_numeric
### Title: Handsontable widget
### Aliases: hot_validate_numeric

### ** Examples

library(rhandsontable)
MAT = matrix(rnorm(50), nrow = 10, dimnames = list(LETTERS[1:10],
             letters[1:5]))

rhandsontable(MAT * 10) %>%
  hot_validate_numeric(col = 1, min = -50, max = 50, exclude = 40)

rhandsontable(MAT * 10) %>%
  hot_validate_numeric(col = 1, choices = c(10, 20, 40))



