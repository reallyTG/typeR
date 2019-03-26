library(kidney.epi)


### Name: service.strict_to_numeric_threshhold_lower
### Title: Select only numeric values greater than defined threshhold.
### Aliases: service.strict_to_numeric_threshhold_lower

### ** Examples

myvals <- c(1, 8, -5, "oggi", NA)
# ruturn to myvals2 only numeric values greater than defined threshhold (0 in this case)
#    and susbstitute non-numeric or negative values with NA
myvals2 <- service.strict_to_numeric_threshhold_lower(myvals, 0)
myvals2 # 1, 8, NA, NA, NA




