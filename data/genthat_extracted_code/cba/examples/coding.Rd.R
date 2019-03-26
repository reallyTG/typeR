library(cba)


### Name: coding
### Title: Dummy Coding
### Aliases: as.dummy as.dummy.matrix as.dummy.data.frame
### Keywords: cluster

### ** Examples

### 
x <- as.integer(sample(3,10,rep=TRUE))
as.dummy(x)
is.na(x) <- c(3,5)
as.dummy(x)
x <- as.data.frame(x)
as.dummy(x)



