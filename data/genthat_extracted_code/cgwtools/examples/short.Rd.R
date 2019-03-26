library(cgwtools)


### Name: short
### Title: Returns a small sample of the specified data set.
### Aliases: short

### ** Examples

foo<-matrix(runif(100),nrow=20)
short(foo)
short(foo,numel=6,skipel=10)
short(foo,numel=6,skipel=10,dorows=TRUE)



