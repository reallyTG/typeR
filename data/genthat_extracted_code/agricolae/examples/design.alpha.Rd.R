library(agricolae)


### Name: design.alpha
### Title: Alpha design type (0,1)
### Aliases: design.alpha
### Keywords: design

### ** Examples

library(agricolae)
#Example one
trt<-1:30
t <- length(trt)
# size block k
k<-3
# Blocks s
s<-t/k
# replications r
r <- 2
outdesign<- design.alpha(trt,k,r,serie=2)
book<-outdesign$book
plots<-book[,1]
dim(plots)<-c(k,s,r)
for (i in 1:r) print(t(plots[,,i]))
outdesign$sketch
# Example two 
trt<-letters[1:12] 
t <- length(trt)
k<-3
r<-3
s<-t/k
outdesign<- design.alpha(trt,k,r,serie=2)
book<-outdesign$book
plots<-book[,1]
dim(plots)<-c(k,s,r)
for (i in 1:r) print(t(plots[,,i]))
outdesign$sketch



