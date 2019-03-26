library(memisc)


### Name: sort-methods
### Title: Convenience Methods to Sort Data Frames and Data Sets
### Aliases: sort.data.frame sort.data.set

### ** Examples

DF <- data.frame(
        a = sample(1:2,size=20,replace=TRUE),
        b = sample(1:4,size=20,replace=TRUE))
sort(DF)
sort(DF,by=~a+b)
sort(DF,by=~b+a)
sort(DF,by=c("b","a"))
sort(DF,by=c("a","b"))



