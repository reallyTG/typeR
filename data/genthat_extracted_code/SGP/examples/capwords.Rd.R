library(SGP)


### Name: capwords
### Title: Function for converting all caps to mixed case. Useful in data
###   cleaning.
### Aliases: capwords
### Keywords: documentation

### ** Examples

capwords("TEST") ## Test
capwords("TEST1 TEST2") ## Test1 Test2
capwords("O'NEIL") ## O'Neil
capwords("JOHN'S") ## John's

## Use sapply for converting character vectors

test.vector <- paste("TEST", 1:10, sep="")
sapply(test.vector, capwords)


## With factors, convert levels instead of the entire vector

test.factor <- factor(paste("TEST", rep(letters[1:10], each=50)))
levels(test.factor) <- sapply(levels(test.factor), capwords)
levels(test.factor)



