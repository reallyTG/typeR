library(rlist)


### Name: list.do
### Title: Call a function with a list of arguments
### Aliases: list.do

### ** Examples

x <- lapply(1:3, function(i) { c(a=i,b=i^2)})
df <- lapply(1:3, function(i) { data.frame(a=i,b=i^2,c=letters[i])})
list.do(x, rbind)



