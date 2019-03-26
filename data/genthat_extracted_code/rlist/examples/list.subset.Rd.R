library(rlist)


### Name: list.subset
### Title: Subset a list
### Aliases: list.subset

### ** Examples

x <- list(p1 = list(type='A',score=list(c1=10,c2=8)),
       p2 = list(type='B',score=list(c1=9,c2=9)),
       p3 = list(type='B',score=list(c1=9,c2=7)))
list.subset(x, c('p1','p2'))
list.subset(x, grepl('^p', names(x)))
## Not run: 
##D list.subset(x, stringdist::stringdist(names(x), 'x1') <= 1)
## End(Not run)



