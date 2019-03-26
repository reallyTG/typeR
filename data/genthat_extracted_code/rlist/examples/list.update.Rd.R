library(rlist)


### Name: list.update
### Title: Update a list by appending or modifying its elements.
### Aliases: list.update

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.update(x, high=max(score$c1,score$c2), low=min(score$c1,score$c2))
list.update(x, exams=length(score))
list.update(x, grade=ifelse(type=='A', score$c1, score$c2))
list.update(x, score=list(min=0, max=10))



