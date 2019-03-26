library(ENmisc)


### Name: mlapply
### Title: Apply a Function of Multiple Arguments
### Aliases: mlapply

### ** Examples

mlapply(list(list(1,2,3),list(4,5,6)),function(x,y)x^2+y^2)
mlapply(list(list(a=1,b=2,c=3),list(4,5,6)),function(x,y)x^2+y^2)
mlapply(list(list(a=1,b=2,c=3),list(4,5,6)),function(x,y,e)x^e+y^e,3)
mlapply(list(list(1,2,3),list(4,5,6)),function(x,y,const=0)x^2+y^2+const)



