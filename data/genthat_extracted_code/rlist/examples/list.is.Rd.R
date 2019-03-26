library(rlist)


### Name: list.is
### Title: Return a logical vector that indicates if each member of a list
###   satisfies a given condition
### Aliases: list.if list.is

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.is(x,type=='B')
list.is(x,min(score$c1,score$c2) >= 8)



