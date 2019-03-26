library(pequod)


### Name: summary.lmres
### Title: summary for lmres object
### Aliases: summary.lmres print.summary.lmres
### Keywords: ~kwd1 ~kwd2

### ** Examples


library(car)
data(Ginzberg)
model1<-lmres(adjdep~adjsimp*adjfatal, centered=c("adjsimp", "adjfatal"),
data=Ginzberg)

summary(model1)
summary(model1, type="nested")

## The function is currently defined as
function (object, type = "default", ...) 




