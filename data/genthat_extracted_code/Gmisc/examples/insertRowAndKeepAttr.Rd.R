library(Gmisc)


### Name: insertRowAndKeepAttr
### Title: Insert a row into a matrix
### Aliases: insertRowAndKeepAttr

### ** Examples

test <- matrix(1:4, ncol=2)
attr(test, 'wow') <- 1000
test <- insertRowAndKeepAttr(test, 2)
print(attr(test, 'wow'))




