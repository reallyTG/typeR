library(rlist)


### Name: list.sort
### Title: Sort a list by given expressions
### Aliases: list.sort

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.sort(x, type, (score$c2)) # sort by score$c2 in descending order
list.sort(x, min(score$c1,score$c2))



