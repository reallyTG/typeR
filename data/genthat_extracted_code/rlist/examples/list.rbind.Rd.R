library(rlist)


### Name: list.rbind
### Title: Bind all list elements by row
### Aliases: list.rbind

### ** Examples

x <- lapply(1:3,function(i) { c(a=i,b=i^2)})
df <- lapply(1:3,function(i) { data.frame(a=i,b=i^2,c=letters[i])})
list.rbind(x)
list.rbind(df)



