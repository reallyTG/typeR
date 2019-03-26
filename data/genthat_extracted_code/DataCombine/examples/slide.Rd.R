library(DataCombine)


### Name: slide
### Title: A function for creating lag and lead variables, including for
###   time-series cross-sectional data.
### Aliases: slide

### ** Examples

# Create dummy data
A <- B <- C <- sample(1:20, size = 20, replace = TRUE)
ID <- sort(rep(seq(1:4), 5))
Data <- data.frame(ID, A, B, C)

# Lead the variable by two time units
DataSlid1 <- slide(Data, Var = 'A', NewVar = 'ALead', slideBy = 2)

# Lag the variable one time unit by ID group
DataSlid2 <- slide(data = Data, Var = 'B', GroupVar = 'ID',
                NewVar = 'BLag', slideBy = -1)

# Lag the variable one time unit by ID group, with invalid lags
Data <- Data[1:16, ]

DataSlid3 <- slide(data = Data, Var = 'B', GroupVar = 'ID',
                 NewVar = 'BLag', slideBy = -2, keepInvalid = TRUE)




