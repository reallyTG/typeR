library(ENmisc)


### Name: mtapply
### Title: Apply a Function of Multiple Arguments Over a Ragged Array
### Aliases: mtapply

### ** Examples

require(Hmisc)
x<-1:10
fc<-rep(c("a","b"),each=5)
wt<-1:10
mtapply(list(x,wt),fc,wtd.mean)
mtapply(list(x,rep(1/10,10)),fc,wtd.mean)



