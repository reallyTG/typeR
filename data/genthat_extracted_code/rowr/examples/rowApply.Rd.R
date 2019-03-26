library(rowr)


### Name: rowApply
### Title: Applies a function row-wise on any data object.
### Aliases: rowApply

### ** Examples

rowApply(list(1,2,3),function (x) sum(unlist(x)))
df<-data.frame(a=c(1,2,3),b=c(1,2,3))
rowApply(df,sum)



