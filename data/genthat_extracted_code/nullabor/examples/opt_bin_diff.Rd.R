library(nullabor)


### Name: opt_bin_diff
### Title: Finds the number of bins in x and y direction which gives the
###   maximum binned distance.
### Aliases: opt_bin_diff

### ** Examples

if(require('dplyr')){
opt_bin_diff(lineup(null_permute('mpg'), mtcars, pos = 1), var = c('mpg', 'wt'),
2, 5, 4, 8, pos = 1, plot = TRUE, m = 8)
}



