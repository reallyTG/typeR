library(taRifx)


### Name: sort.data.frame
### Title: Sort a data.frame
### Aliases: sort.data.frame

### ** Examples

library(datasets)
sort.data.frame(ChickWeight,formula=~weight+Time)

mydf <- data.frame(col1 = runif(10))
rownames(mydf) <- paste("x", 1:10, sep = "")
sort(mydf, f = ~col1) # drops a dimension
sort(mydf, f = ~col1, drop = FALSE) # does not drop a dimension (returns a data.frame)



