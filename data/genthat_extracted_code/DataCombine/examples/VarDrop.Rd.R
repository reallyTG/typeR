library(DataCombine)


### Name: VarDrop
### Title: Drop one or more variables from a data frame.
### Aliases: VarDrop

### ** Examples

# Create dummy data
a <- c(1, 2, 3, 4, NA)
b <- c( 1, NA, 3, 4, 5)
c <- c(1:5)
d <- c(1:5)
ABCData <- data.frame(a, b, c, d)

# Drop a and b
DroppedData <- VarDrop(ABCData, c('b', 'c'))




