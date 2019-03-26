library(longCatEDA)


### Name: makePatterns
### Title: Concatenate Multivariate Data into Numeric or Character Patterns
### Aliases: makePatterns

### ** Examples

# create an arbitrary matrix and demonstrate
temp <- matrix( sample(1:9, 40, replace=TRUE), 10, 4)
print(temp)
makePatterns(temp, num=FALSE)

# examine the unique patterns of data
bindat <- matrix( sample(0:1, 500, replace=TRUE), 100, 5)
uniquePatterns <- makePatterns( bindat, num=FALSE)
as.matrix( table( uniquePatterns ) )




