library(assist)


### Name: predict.slm
### Title: Predict Method for Semiparametric Linear Mixed Effects Model
###   Fits
### Aliases: predict.slm
### Keywords: file

### ** Examples

data(dog)

dog.fit<-slm(y~group*time, rk=list(cubic(time), shrink1(group),
    rk.prod(kron(time-0.5),shrink1(group)),rk.prod(cubic(time), 
    shrink1(group))), random=list(dog=~1), data=dog)

predict(dog.fit)



