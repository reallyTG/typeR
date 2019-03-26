library(rlist)


### Name: list.flatten
### Title: Flatten a nested list to a one-level list
### Aliases: list.flatten

### ** Examples

p <- list(a=1,b=list(b1=2,b2=3),c=list(c1=list(c11='a',c12='x'),c2=3))
list.flatten(p)

p <- list(a=1,b=list(x="a",y="b",z=10))
list.flatten(p, classes = "numeric")
list.flatten(p, classes = "character")



