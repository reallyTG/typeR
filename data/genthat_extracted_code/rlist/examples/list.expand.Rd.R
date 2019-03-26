library(rlist)


### Name: list.expand
### Title: Create a list from all combinations of factors
### Aliases: list.expand

### ** Examples

list.expand(x=1:10, y=c("a","b","c"))
list.expand(x=list(c(1,2), c(2,3)), y = c("a","b","c"))
list.expand(
  a=list(list(x=1,y="a"), list(x=2, y="b")),
  b=list(c("x","y"), c("y","z","w")))



