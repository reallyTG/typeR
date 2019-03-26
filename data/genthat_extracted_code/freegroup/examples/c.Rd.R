library(freegroup)


### Name: c
### Title: Concatenation of free objects
### Aliases: c c.free c rep.free

### ** Examples

x <- rfree(10,3)
y <- rfree(10,3)
c(x,y)


## NB: compare
rep(x,2)  
x*2  



