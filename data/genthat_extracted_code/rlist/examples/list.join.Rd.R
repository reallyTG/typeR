library(rlist)


### Name: list.join
### Title: Join two lists by single or multiple keys
### Aliases: list.join

### ** Examples

l1 <- list(p1=list(name='Ken',age=20),
       p2=list(name='James',age=21),
       p3=list(name='Jenny',age=20))
l2 <- list(p1=list(name='Jenny',age=20,type='A'),
       p2=list(name='Ken',age=20,type='B'),
       p3=list(name='James',age=22,type='A'))
list.join(l1, l2, name)
list.join(l1, l2, .[c('name','age')])



