library(rlist)


### Name: list.first
### Title: Find the first element that meets a condition
### Aliases: list.first

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.first(x, score$c1 < 10)
list.first(x, score$c1 < 9 || score$c3 >= 5) # NULL for all results are NA or FALSE



