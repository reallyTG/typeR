library(FAOSTAT)


### Name: scaleUnit
### Title: A function to standardize the unit
### Aliases: scaleUnit

### ** Examples

## Create the data frame
test.df = data.frame(FAOST_CODE = 1:5, Year = 1995:1999,
  var1 = 1:5, var2 = 5:1)

## Create the named vector for scaling
multiplier = c(1, 10)
names(multiplier) = c("var1", "var2")

## Scale the data
scaleUnit(test.df, multiplier = multiplier)



