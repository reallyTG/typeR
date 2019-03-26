library(iterpc)


### Name: iterpc
### Title: Efficient Iterator for Permutations and Combinations
### Aliases: iterpc iterpc-package

### ** Examples

#1) all combinations of drawing 2 items from {1, 2, 3}
I <- iterpc(5, 2)
getall(I)

#2) continuing 1), get combination by combination
I <- iterpc(5, 2)
getnext(I) # return 1,2
getnext(I) # return 1,3
getnext(I, 2) # return next 2 results

#3) 3) all permutations of {1, 2, 3} and use of labels
I <- iterpc(3, labels=c("a", "b", "c"), ordered=TRUE)
getall(I)

#4) permutations of multiset and
I <- iterpc(c(2, 1, 1), labels=c("a", "b", "c"), ordered=TRUE)
getall(I)

#5) combinations with replacement and the use of table as input
x <- c("a","a","b","c")
I <- iterpc(table(x), 3, replace=TRUE)
getall(I)



