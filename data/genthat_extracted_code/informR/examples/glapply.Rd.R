library(informR)


### Name: glapply
### Title: Group Level Apply
### Aliases: glapply

### ** Examples

data(Indometh)
glapply(Indometh$conc,Indometh$Subject,FUN=mean)
x<-rep(sample(1:10),2)
id<-rep(letters[1:5],4)
glapply(x,id,FUN=function(x)sum((x-mean(x))^2),regroup=FALSE)
glapply(x,id,FUN=function(x)sum((x-mean(x))^2),regroup=TRUE)
#Compare with output produced by by()
by(x,id,function(x)sum((x-mean(x))^2))



