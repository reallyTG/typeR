library(palr)


### Name: chlPal
### Title: Ocean colour colours for chlorophyll-a.
### Aliases: chlPal

### ** Examples

## Not run: 
##D chl <- raadtools::readchla(xylim = c(100, 110, -50, -40))
##D ## just get a small number of evenly space colours
##D plot(chl, col = chlPal(10))
##D ## store the full palette and work with values and colours
##D pal <- chlPal()
##D ## the standard full palette
##D plot(chl, breaks = pal$breaks, col = pal$cols)
##D ## a custom set of values with matching colours
##D plot(chl, col = chlPal(pal$breaks[seq(1, length(pal$breaks), length = 10)]))
##D ## any number of colours stored as a function
##D myfun <- chlPal()
##D plot(chl, col = myfun(18))
##D ## just n colours
##D plot(chl, col = chlPal(18))
## End(Not run)



