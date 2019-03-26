library(rlist)


### Name: list.count
### Title: Count the number of elements that satisfy given condition
### Aliases: list.count

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.count(x, type=='B')
list.count(x, min(unlist(score)) >= 9)



