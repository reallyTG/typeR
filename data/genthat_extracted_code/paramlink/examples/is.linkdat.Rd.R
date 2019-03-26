library(paramlink)


### Name: is.linkdat
### Title: Is an object a linkdat object?
### Aliases: is.linkdat is.singleton is.linkdat.list

### ** Examples


x1 = nuclearPed(1)
x2 = singleton(1)
stopifnot(is.linkdat(x1), !is.singleton(x1), 
          is.linkdat(x2), is.singleton(x2),
          is.linkdat.list(list(x1,x2)))




