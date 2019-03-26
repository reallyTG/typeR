library(nullabor)


### Name: calc_diff
### Title: Calculating the difference between true plot and the null plot
###   with the maximum distance.
### Aliases: calc_diff

### ** Examples

if(require('dplyr')){
lineup.dat <- lineup(null_permute('mpg'), mtcars, pos = 1)
calc_diff(lineup.dat, var = c('mpg', 'wt'), met = 'bin_dist',
dist.arg = list(lineup.dat = lineup.dat, X.bin = 5, Y.bin = 5), pos = 1, m = 8)}

if(require('dplyr')){
calc_diff(lineup(null_permute('mpg'), mtcars, pos = 1), var = c('mpg', 'wt'), met = 'reg_dist',
dist.arg = NULL, pos = 1, m = 8)}



