library(DataCombine)


### Name: InsertRow
### Title: Inserts a new row into a data frame
### Aliases: InsertRow

### ** Examples

# Create dummy data
A <- B <- C <- D <- sample(1:20, size = 20, replace = TRUE)
Data <- data.frame(A, B, C, D)

# Create new row
New <- rep(1000, 4)

# Insert into 4th row
Data <- InsertRow(Data, NewRow = New, RowNum = 4)




