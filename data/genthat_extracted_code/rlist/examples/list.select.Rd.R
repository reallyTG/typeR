library(rlist)


### Name: list.select
### Title: Select by name or expression for each member of a list
### Aliases: list.select

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.select(x, type)
list.select(x, tp = type)
list.select(x, type, score)
list.select(x, type, score.range = range(unlist(score)))



