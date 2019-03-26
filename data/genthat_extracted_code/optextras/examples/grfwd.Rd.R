library(optextras)


### Name: grfwd
### Title: Forward difference numerical gradient approximation.
### Aliases: grfwd optsp
### Keywords: optimize

### ** Examples

cat("Example of use of grfwd\n")

myfn<-function(xx, shift=100){
    ii<-1:length(xx)
    result<-shift+sum(xx^ii)
}
xx<-c(1,2,3,4)
ii<-1:length(xx)
print(xx)
gn<-grfwd(xx,myfn, shift=0)
print(gn)
ga<-ii*xx^(ii-1)
cat("compare to\n")
print(ga)



