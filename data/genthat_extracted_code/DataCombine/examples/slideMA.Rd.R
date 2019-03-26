library(DataCombine)


### Name: slideMA
### Title: Create a moving average for a period before or after each time
###   point for a given variable
### Aliases: slideMA

### ** Examples

 # Create dummy data
 A <- B <- C <- sample(1:20, size = 20, replace = TRUE)
 ID <- sort(rep(seq(1:4), 5))
 Data <- data.frame(ID, A, B, C)

 # Lead the variable by two time units
 DataSlidMA1 <- slideMA(Data, Var = 'A', NewVar = 'ALead_MA',
                 periodBound = 3)

 # Lag the variable one time unit by ID group
 DataSlidMA2 <- slideMA(data = Data, Var = 'B', GroupVar = 'ID',
                NewVar = 'BLag_MA', periodBound = -3, offset = 2)




