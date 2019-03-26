library(BART)


### Name: bartModelMatrix
### Title: Create a matrix out of a vector or data.frame
### Aliases: bartModelMatrix
### Keywords: utilities

### ** Examples


set.seed(99)

a <- rbinom(10, 4, 0.4)

table(a)

x <- runif(10)

df <- data.frame(a=factor(a), x=x)

b <- bartModelMatrix(df)

b

b <- bartModelMatrix(df, numcut=9)

b

b <- bartModelMatrix(df, numcut=9, usequants=TRUE)

b

## Not run: 
##D     f <- bartModelMatrix(as.character(a))
## End(Not run)



