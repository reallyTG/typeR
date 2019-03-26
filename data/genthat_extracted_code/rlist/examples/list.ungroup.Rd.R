library(rlist)


### Name: list.ungroup
### Title: Ungroup a list by taking out second-level elements
### Aliases: list.ungroup

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
xg <- list.group(x, type)
list.ungroup(xg)

x <- list(a = list(a1 = list(x=list(x1=2,x2=3),y=list(y1=1,y2=3))),
       b = list(b1 = list(x=list(x1=2,x2=6),y=list(y1=3,y2=2))))
list.ungroup(x, level = 1)
list.ungroup(x, level = 2)
list.ungroup(x, level = 2, group.names = TRUE)



