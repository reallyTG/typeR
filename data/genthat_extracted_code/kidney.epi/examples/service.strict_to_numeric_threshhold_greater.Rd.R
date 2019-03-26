library(kidney.epi)


### Name: service.strict_to_numeric_threshhold_greater
### Title: Select only numeric values lower than defined threshhold
### Aliases: service.strict_to_numeric_threshhold_greater

### ** Examples

myvals <- c(1, 8, -5, "oggi", NA)
# ruturn to myvals2 only numeric values lower than threshhold  (3 in this case)
#   susbstitute non-numeric or negative values with NA
myvals2 <- service.strict_to_numeric_threshhold_greater(myvals, 3)
myvals2 # 1, NA, -5, NA, NA




