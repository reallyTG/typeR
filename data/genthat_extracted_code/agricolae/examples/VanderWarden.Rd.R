library(agricolae)


### Name: waerden.test
### Title: Multiple comparisons. The van der Waerden (Normal Scores)
### Aliases: waerden.test
### Keywords: nonparametric

### ** Examples

library(agricolae)
# example 1
data(corn)
out1<-with(corn,waerden.test(observation,method,group=TRUE))
print(out1$groups)
plot(out1)
out2<-with(corn,waerden.test(observation,method,group=FALSE))
print(out2$comparison)
# example 2
data(sweetpotato)
out<-with(sweetpotato,waerden.test(yield,virus,alpha=0.01,group=TRUE))
print(out)



