library(rhandsontable)


### Name: hot_heatmap
### Title: Handsontable widget
### Aliases: hot_heatmap

### ** Examples

MAT = matrix(rnorm(50), nrow = 10, dimnames = list(LETTERS[1:10],
             letters[1:5]))

rhandsontable(MAT) %>%
 hot_heatmap()



