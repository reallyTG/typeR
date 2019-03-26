library(nullabor)


### Name: distplot
### Title: Plotting the distribution of the distance measure
### Aliases: distplot

### ** Examples

## Not run: 
##D if (require('dplyr')) {
##D   d <- lineup(null_permute('mpg'), mtcars, pos = 1)
##D   library(ggplot2)
##D   ggplot(d, aes(mpg, wt)) + geom_point() + facet_wrap(~.sample)
##D   distplot(distmet(d, var = c('mpg', 'wt'), 'reg_dist', null_permute('mpg'),
##D     pos = 1, repl = 100, m = 8), m = 8)
##D }
## End(Not run)



