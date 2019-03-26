library(DataCombine)


### Name: DropNA
### Title: Drop rows from a data frame with missing values on a given
###   variable(s).
### Aliases: DropNA

### ** Examples

# Create data frame
a <- c(1:4, NA)
b <- c(1, NA, 3:5)
ABData <- data.frame(a, b)

# Remove missing values from column a
ASubData <- DropNA(ABData, Var = "a", message = FALSE)

# Remove missing values in columns a and b
ABSubData <- DropNA(ABData, Var = c("a", "b"))

# Remove missing values in all columns of ABDatat
AllSubData <- DropNA(ABData)




