library(rlist)


### Name: list.all
### Title: Examine if a condition is true for all elements of a list
### Aliases: list.all

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.all(x, type=='B')
list.all(x, mean(unlist(score))>=6)
list.all(x, score$c2 > 8 || score$c3 > 5, na.rm = TRUE)
list.all(x, score$c2 > 8 || score$c3 > 5, na.rm = FALSE)



