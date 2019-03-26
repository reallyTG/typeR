library(rlist)


### Name: list.remove
### Title: Remove members from a list by index or name
### Aliases: list.remove

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.remove(x, 'p1')
list.remove(x, c(1,2))



