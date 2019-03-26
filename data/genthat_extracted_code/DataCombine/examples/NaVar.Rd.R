library(DataCombine)


### Name: NaVar
### Title: Create new variable(s) indicating if there are missing values in
###   other variable(s)
### Aliases: NaVar

### ** Examples

# Create data frame
a <- c(1, 2, 3, 4, NA)
b <- c( 1, NA, 3, 4, 5)
ABData <- data.frame(a, b)

# Create varibles indicating missing values in columns a and b
ABData1 <- NaVar(ABData, Var = c('a', 'b'))

# Create varible indicating missing values in columns a with reversed dummy
ABData2 <- NaVar(ABData, Var = 'a', reverse = TRUE, message = FALSE)




