library(rlist)


### Name: list.mapv
### Title: Map each member of a list by an expression to a vector.
### Aliases: list.mapv

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.mapv(x, type)
list.mapv(x, min(score$c1,score$c2))



