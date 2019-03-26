library(assist)


### Name: slm
### Title: Fit a Semi-parametric Linear Mixed Effects Model
### Aliases: slm
### Keywords: file

### ** Examples

## SS ANOVA is used to model "time" and "group" 
## with random intercept for "dog".
data(dog)

dog.fit<- slm(y~group*time, rk=list(cubic(time), shrink1(group),
    	rk.prod(kron(time-0.5),shrink1(group)),rk.prod(cubic(time), 
    	shrink1(group))), random=list(dog=~1), data=dog)



