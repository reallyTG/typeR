library(DataCombine)


### Name: PercChange
### Title: Calculate the percentage change from a specified lag, including
###   within groups
### Aliases: PercChange

### ** Examples

# Create fake data frame
A <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2)
B <- c(1:10)
Data <- data.frame(A, B)

# Find percentage change from two periods before
Out <- PercChange(Data, Var = 'B',
         type = 'proportion',
         NewVar = 'PercentChange',
         slideBy = -2)

Out



