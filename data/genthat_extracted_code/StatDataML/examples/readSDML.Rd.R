library(StatDataML)


### Name: readSDML
### Title: Read StatDataML Files
### Aliases: readSDML
### Keywords: file

### ** Examples

library(XML)

TEST <-
    function(x) identical(readSDML(text = capture.output(writeSDML(x))), x)

# write/read vector with names
a <- 1:15
names(a) <- paste("n", 1:15, sep="")
stopifnot(TEST(a))

# write/read a matrix
A <- matrix(1:16, ncol=4)
rownames(A) <- paste("row", 1:4, sep="")
colnames(A) <- paste("col", 1:4, sep="")
stopifnot(TEST(A))

# write/read a data.frame
data(iris)
stopifnot(TEST(iris))

# write/read a ts object
data(airmiles)
stopifnot(TEST(airmiles))

# write/read the islands data
data(islands)
stopifnot(TEST(islands))




