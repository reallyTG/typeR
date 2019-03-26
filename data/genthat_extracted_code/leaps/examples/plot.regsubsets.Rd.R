library(leaps)


### Name: plot.regsubsets
### Title: Graphical table of best subsets
### Aliases: plot.regsubsets
### Keywords: hplot regression

### ** Examples

data(swiss)
a<-regsubsets(Fertility~.,nbest=3,data=swiss)
par(mfrow=c(1,2))
plot(a)
plot(a,scale="r2")



