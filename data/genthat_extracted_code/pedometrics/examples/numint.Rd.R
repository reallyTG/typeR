library(pedometrics)


### Name: isNumint
### Title: Tests for data types
### Aliases: allFactor allInteger allNumeric allNumint anyFactor anyInteger
###   anyNumeric anyNumint isNumint uniqueClass whichFactor whichInteger
###   whichNumeric whichNumint

### ** Examples

# Vector of integers
x <- 1:10
isNumint(x) # FALSE

# Vector of numeric integers
x <- as.numeric(x)
isNumint(x) # TRUE

# Vector of numeric values
x <- c(1.1, 1, 1, 1, 2)
isNumint(x) # FALSE
allNumint(x) # FALSE
anyNumint(x) # TRUE
whichNumint(x)

# Single numeric integer
isNumint(1) # TRUE

# Single numeric value
isNumint(1.1) # FALSE



