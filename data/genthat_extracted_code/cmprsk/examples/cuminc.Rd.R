library(cmprsk)


### Name: cuminc
### Title: Cumulative Incidence Analysis
### Aliases: cuminc
### Keywords: survival

### ** Examples

set.seed(2)
ss <- rexp(100)
gg <- factor(sample(1:3,100,replace=TRUE),1:3,c('a','b','c'))
cc <- sample(0:2,100,replace=TRUE)
strt <- sample(1:2,100,replace=TRUE)
print(xx <- cuminc(ss,cc,gg,strt))
plot(xx,lty=1,color=1:6)
# see also test.R, test.out



