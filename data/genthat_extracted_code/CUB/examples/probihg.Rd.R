library(CUB)


### Name: probihg
### Title: Probability distribution of an IHG model
### Aliases: probihg
### Keywords: distribution

### ** Examples

m<-10
theta<-0.30
pr<-probihg(m,theta)
plot(1:m,pr,type="h",xlab="Ordinal categories")
points(1:m,pr,pch=19)



