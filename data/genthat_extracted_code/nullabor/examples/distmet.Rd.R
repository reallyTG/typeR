library(nullabor)


### Name: distmet
### Title: Empirical distribution of the distance
### Aliases: distmet

### ** Examples

# Each of these examples uses a small number of nulls (m=8), and a small number of
# repeated sampling from the null distribution (repl=100), to make it faster to run.
# In your own examples you should think about increasing each of these, at least to the defaults.
## Not run: 
##D if (require('dplyr')) {
##D   d <- lineup(null_permute('mpg'), mtcars, pos = 1)
##D   dd <- distmet(d, var = c('mpg', 'wt'),
##D     'reg_dist', null_permute('mpg'), pos = 1, repl = 100, m = 8)
##D   distplot(dd, m=8)
##D }
## End(Not run)

## Not run: 
##D d <- lineup(null_permute('mpg'), mtcars, pos=4, n=8)
##D library(ggplot2)
##D ggplot(d, aes(mpg, wt)) + geom_point() + facet_wrap(~ .sample, ncol=4)
##D if (require('dplyr')) {
##D   dd <- distmet(d, var = c('mpg', 'wt'), 'bin_dist', null_permute('mpg'),
##D     pos = 4, repl = 100, dist.arg = list(lineup.dat = d, X.bin = 5,
##D     Y.bin = 5), m = 8)
##D   distplot(dd, m=8)
##D }
## End(Not run)

# Example using bin_dist
## Not run: 
##D if (require('dplyr')) {
##D   d <- lineup(null_permute('mpg'), mtcars, pos = 1)
##D   library(ggplot2)
##D   ggplot(d, aes(mpg, wt)) + geom_point() + facet_wrap(~ .sample, ncol=5)
##D   dd <- distmet(d, var = c('mpg', 'wt'),
##D     'bin_dist', null_permute('mpg'), pos = 1, repl = 500,
##D     dist.arg = list(lineup.dat = d, X.bin = 5, Y.bin = 5))
##D   distplot(dd)
##D }
## End(Not run)

# Example using uni_dist
## Not run: 
##D mod <- lm(wt ~ mpg, data = mtcars)
##D resid.dat <- data.frame(residual = mod$resid)
##D d <- lineup(null_dist('residual', dist = 'normal'), resid.dat, pos=19)
##D ggplot(d, aes(residual)) + geom_histogram(binwidth = 0.25) + facet_wrap(~ .sample, ncol=5)
##D if (require('dplyr')) {
##D   dd <- distmet(d, var = 'residual', 'uni_dist', null_dist('residual',
##D     dist = 'normal'), pos = 19, repl = 500)
##D   distplot(dd)
##D }
## End(Not run)



