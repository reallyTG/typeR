library(rlist)


### Name: list.find
### Title: Find a specific number of elements in a list or vector
###   satisfying a given condition
### Aliases: list.find

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.find(x, type=='B', 1)
list.find(x, min(score$c1,score$c2) >= 9)



