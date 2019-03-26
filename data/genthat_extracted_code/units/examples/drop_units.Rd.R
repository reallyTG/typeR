library(units)


### Name: drop_units
### Title: Drop Units
### Aliases: drop_units

### ** Examples

x <- 1
y <- set_units(x, m/s)

# this succeeds
drop_units(y)
set_units(y, NULL)
set_units(x, NULL)

## Not run: 
##D # this fails
##D drop_units(x)
## End(Not run)




