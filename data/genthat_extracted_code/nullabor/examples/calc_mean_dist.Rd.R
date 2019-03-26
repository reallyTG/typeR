library(nullabor)


### Name: calc_mean_dist
### Title: Calculating the mean distances of each plot in the lineup.
### Aliases: calc_mean_dist

### ** Examples

if(require('dplyr')){
calc_mean_dist(lineup(null_permute('mpg'), mtcars, pos = 1), var = c('mpg', 'wt'),
met = 'reg_dist', pos = 1)}



