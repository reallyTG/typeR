library(rPraat)


### Name: it.interpolate
### Title: it.interpolate
### Aliases: it.interpolate

### ** Examples

it <- it.sample()
it2 <- it.interpolate(it, seq(it$t[1], it$t[length(it$t)], by = 0.001))
## Not run: 
##D it.plot(it)
##D it.plot(it2)
## End(Not run)



