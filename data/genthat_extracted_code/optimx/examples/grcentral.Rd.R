library(optimx)


### Name: grcentral
### Title: Central difference numerical gradient approximation.
### Aliases: grcentral
### Keywords: optimize

### ** Examples

cat("Example of use of grcentral\n")

myfn<-function(xx, shift=100){
    ii<-1:length(xx)
    result<-shift+sum(xx^ii)
}
xx<-c(1,2,3,4)
ii<-1:length(xx)
print(xx)
gn<-grcentral(xx,myfn, shift=0)
print(gn)
ga<-ii*xx^(ii-1)
cat("compare to\n")
print(ga)




