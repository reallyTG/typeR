library(Hmisc)


### Name: histboxp
### Title: Use plotly to Draw Stratified Spike Histogram and Box Plot
###   Statistics
### Aliases: histboxp
### Keywords: hplot

### ** Examples

## Not run: 
##D dist <- c(rep(1, 500), rep(2, 250), rep(3, 600))
##D Distribution <- factor(dist, 1 : 3, c('Unimodal', 'Bimodal', 'Trimodal'))
##D x <- c(rnorm(500, 6, 1),
##D        rnorm(200, 3, .7), rnorm(50, 7, .4),
##D        rnorm(200, 2, .7), rnorm(300, 5.5, .4), rnorm(100, 8, .4))
##D histboxp(x=x, group=Distribution, sd=TRUE)
## End(Not run)



