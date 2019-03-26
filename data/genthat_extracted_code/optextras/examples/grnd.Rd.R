library(optextras)


### Name: grnd
### Title: A reorganization of the call to numDeriv grad() function.
### Aliases: grnd
### Keywords: nonlinear optimize

### ** Examples

cat("Example of use of grnd\n")
require(numDeriv)
myfn<-function(xx, shift=100){
    ii<-1:length(xx)
    result<-shift+sum(xx^ii)
}
xx<-c(1,2,3,4)
ii<-1:length(xx)
print(xx)
gn<-grnd(xx,myfn, shift=0)
print(gn)
ga<-ii*xx^(ii-1)
cat("compare to\n")
print(ga)



