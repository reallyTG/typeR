library(errint)


### Name: measure
### Title: Measures
### Aliases: as.measure is.measure measure

### ** Examples

measure(0.1,0.7)

measure(0.1,0.7,function(x,y){y-x})


l<-list(s=0.1,acc=0.78,f=function(x,y){abs(x-y)},err=0.02)
as.measure(l)

v<-c("a","b")
as.measure(v)


l<-list(s=0.1,acc=0.78,f=function(x,y){abs(x-y)},err=0.02)
is.measure(l)
res<-as.measure(l)
is.measure(res)



