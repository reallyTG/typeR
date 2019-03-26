library(pscl)


### Name: summary.rollcall
### Title: summarize a rollcall object
### Aliases: summary.rollcall print.summary.rollcall
### Keywords: classes

### ** Examples

set.seed(314159265)
fakeData <- matrix(sample(x=c(0,1),size=1000,replace=TRUE),
                   10,100)
rc <- rollcall(fakeData)
rc

data(sc9497)
rc <- rollcall(sc9497)
summary(rc)

data(s109)
summary(s109)
summary(s109,verbose=TRUE)



