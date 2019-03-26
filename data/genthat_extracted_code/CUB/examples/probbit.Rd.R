library(CUB)


### Name: probbit
### Title: Probability distribution of a shifted Binomial random variable
### Aliases: probbit
### Keywords: distribution

### ** Examples

m<-7
csi<-0.7
pr<-probbit(m,csi)
plot(1:m,pr,type="h",main="Shifted Binomial probability distribution",xlab="Categories")
points(1:m,pr,pch=19)



