library(rlist)


### Name: list.iter
### Title: Iterate a list by evaluating an expression on each list element
### Aliases: list.iter

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.iter(x,cat(paste(type,'\n')))
list.iter(x,cat(str(.)))



