library(rlist)


### Name: list.findi
### Title: Find the indices of a number of elements in a list or vector
###   satisfying a given condition
### Aliases: list.findi

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.findi(x, type=='B')
list.findi(x, min(score$c1,score$c2) >= 8)
list.findi(x, min(score$c1,score$c2) <= 8, n = 2)



