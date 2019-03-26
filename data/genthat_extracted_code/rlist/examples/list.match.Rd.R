library(rlist)


### Name: list.match
### Title: Select members of a list that match given regex pattern
### Aliases: list.match

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.match(x,'p[12]')
list.match(x,'3')



