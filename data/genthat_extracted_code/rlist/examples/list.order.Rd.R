library(rlist)


### Name: list.order
### Title: Give the order of each list element by expression
### Aliases: list.order

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.order(x, type, (score$c2)) # order by type (ascending) and score$c2 (descending)
list.order(x, min(score$c1,score$c2))
list.order(x, min(score$c1,score$c2), keep.names=TRUE)



