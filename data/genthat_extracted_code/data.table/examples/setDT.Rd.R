library(data.table)


### Name: setDT
### Title: Coerce lists and data.frames to data.table by reference
### Aliases: setDT
### Keywords: data

### ** Examples


set.seed(45L)
X = data.frame(A=sample(3, 10, TRUE),
         B=sample(letters[1:3], 10, TRUE),
         C=sample(10), stringsAsFactors=FALSE)

# Convert X to data.table by reference and
# get the frequency of each "A,B" combination
setDT(X)[, .N, by=.(A,B)]

# convert list to data.table
# autofill names
X = list(1:4, letters[1:4])
setDT(X)
# don't provide names
X = list(a=1:4, letters[1:4])
setDT(X, FALSE)

# setkey directly
X = list(a = 4:1, b=runif(4))
setDT(X, key="a")[]

# check.names argument
X = list(a=1:5, a=6:10)
setDT(X, check.names=TRUE)[]




