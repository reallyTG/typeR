library(CUB)


### Name: probcush
### Title: Probability distribution of a CUSH model
### Aliases: probcush
### Keywords: distribution

### ** Examples

m<-10
shelter<-1
delta<-0.4
pr<-probcush(m,delta,shelter)
plot(1:m,pr,type="h",xlab="Number of categories")
points(1:m,pr,pch=19)



