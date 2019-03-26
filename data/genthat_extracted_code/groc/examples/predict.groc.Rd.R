library(groc)


### Name: predict.groc
### Title: Predict Method for groc
### Aliases: predict.groc
### Keywords: regression multivariate

### ** Examples

data("wood",package="robustbase")
out <- groc(y ~ x1+x2+x3+x4+x5, ncomp=1, data=wood,D=corrob, method="lts")
predict(out)

newdata<- data.frame(x1= 0.5, x2=0.1, x3=0.4, x4=0.5, x5=0.8)
predict(out,newdata)



