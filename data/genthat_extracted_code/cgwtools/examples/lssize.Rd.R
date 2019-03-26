library(cgwtools)


### Name: lssize
### Title: List the sizes of all selected objects.
### Aliases: lssize

### ** Examples

x1<-runif(100)
x2<-runif(1000)
x3<-runif(2000)
lssize(ls(pattern='x[1-3]'))
lssize(ls(pattern='x[1-3]'),byte=TRUE) 
#depending on what you have in your environment:
lssize(lstype('integer'))



