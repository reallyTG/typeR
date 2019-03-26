library(Xmisc)


### Name: popone,list-method
### Title: Remove and return an element from a list
### Aliases: popone,list-method

### ** Examples

ll <- list(1,2,3,a=4,b=5,6,7,c=8,9)
popone(ll,"a")
popone(ll,1) ## remove the 1st in ll
popone(ll,1) ## remove the next (2nd of the origin)
try(popone(list(),"a"))



