library(rlist)


### Name: list.group
### Title: Divide list/vector elements into exclusive groups
### Aliases: list.group

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.group(x, type)
list.group(x, mean(unlist(score)))



