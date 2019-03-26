library(rlist)


### Name: list.map
### Title: Map each element in a list or vector by an expression.
### Aliases: list.map

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.map(x, type)
list.map(x, min(score$c1,score$c2))



