library(burnr)


### Name: intervals
### Title: Constructor for S3 intervals class.
### Aliases: intervals

### ** Examples

data(pgm)
interv <- intervals(composite(pgm))
print(interv)

mean(interv)  # Mean interval

# Now fit log-normal distribution instead of Weibull.
intervals(composite(pgm), densfun = "lognormal")

## Not run: 
##D # Boxplot of fire interval distribution.
##D boxplot(intervals(composite(pgm))$intervals)
## End(Not run)




