library(yll)


### Name: avg_yll
### Title: Compute average years of life lost (YLL)
### Aliases: avg_yll

### ** Examples

# For 100 deaths with an average age of death of 60 years
# and an expected remaining number of years to live of 20 years:

avg_yll(100, 60, 20)

# Without discounting:

avg_yll(100, 60, 20, discount.rate = 0)

## Not run: 
##D avg_yll("a", "b", "c") # arguments must be numeric
##D avg_yll(100) # avg.age.death and life.expectancy are missing,
##D # with no default
##D avg_yll(100, 60) # life.expectancy is missing,
##D # with no default
## End(Not run)




