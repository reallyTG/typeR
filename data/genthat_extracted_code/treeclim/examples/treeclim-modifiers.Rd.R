library(treeclim)


### Name: treeclim-modifiers
### Title: Modifiers for climate parameter selection
### Aliases: .mean .range .sum treeclim-modifiers

### ** Examples

## Not run: 
##D my_calib <- dcc(rt_spruce, list(prec = rt_prec, temp = rt_temp),
##D   .range(4:9, "temp") + .mean(-5:-9, "temp") + .sum(3:10, "prec"))
##D plot(my_calib)
## End(Not run)



