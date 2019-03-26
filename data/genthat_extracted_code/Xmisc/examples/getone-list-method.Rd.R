library(Xmisc)


### Name: getone,list-method
### Title: Get an element by index or name from a list
### Aliases: getone,list-method

### ** Examples

ll <- list(11,22,33,a=44,b=55,66,77,c=88,99)
getone(ll,numeric())
getone(ll,"a")
getone(ll,"c")
getone(ll,1)
getone(ll,7)
getone(ll,7,safe=FALSE)



