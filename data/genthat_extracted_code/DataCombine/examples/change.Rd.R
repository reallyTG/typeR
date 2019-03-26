library(DataCombine)


### Name: change
### Title: Calculate the changes (absolute, percent, and proportion)
###   changes from a specified lag, including within groups
### Aliases: change

### ** Examples

# Create fake data frame
A <- c(1, 1, 1, 1, 1, 2, 2, 2, 2, 2)
B <- c(1:10)
Data <- data.frame(A, B)

# Find percentage change from two periods before
Out <- change(Data, Var = 'B',
         type = 'proportion',
         NewVar = 'PercentChange',
         slideBy = -2)

Out



