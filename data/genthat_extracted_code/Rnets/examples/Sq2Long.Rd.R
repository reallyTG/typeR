library(Rnets)


### Name: Sq2Long
### Title: Matrix reshaping function
### Aliases: Sq2Long

### ** Examples

demo_mat <- matrix(c(1, 5, 2, 5, 1, 0, 2, 0, NA), nrow = 3)
Sq2Long(demo_mat, c('A', 'B', 'value'))
Sq2Long(demo_mat, c('A', 'B', 'value'), drop.values = 0, drop.NA = FALSE)



