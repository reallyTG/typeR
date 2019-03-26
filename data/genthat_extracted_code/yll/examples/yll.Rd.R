library(yll)


### Name: yll
### Title: Compute years of life lost (YLL)
### Aliases: yll

### ** Examples

# For 100 deaths with an average age of death of 60 years
# and an expected remaining number of years to live of 20 years:

yll(100, 60, 20)

# Without discounting:

yll(100, 60, 20, discount.rate = 0)

## Not run: 
##D yll("a", "b", "c") # arguments must be numeric
##D yll(100) # avg.age.death and life.expectancy are missing,
##D # with no default
##D yll(100, 60) # life.expectancy is missing,
##D # with no default
## End(Not run)




