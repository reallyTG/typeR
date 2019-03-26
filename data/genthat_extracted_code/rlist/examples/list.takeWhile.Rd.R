library(rlist)


### Name: list.takeWhile
### Title: Keep taking elements while a condition holds
### Aliases: list.takeWhile

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.takeWhile(x, type=='B')
list.takeWhile(x, min(score$c1,score$c2) >= 8)



