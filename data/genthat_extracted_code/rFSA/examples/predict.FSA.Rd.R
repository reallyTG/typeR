library(rFSA)


### Name: predict.FSA
### Title: Prediction function for FSA solutions
### Aliases: predict.FSA

### ** Examples

#use mtcars package see help(mtcars)
data(mtcars)
colnames(mtcars)
fit<-lmFSA(formula="mpg~hp*wt",data=mtcars,fixvar="hp",
             quad=FALSE,m=2,numrs=10,save_solutions=FALSE,cores=1)
predict(fit)
predict(fit,newdata=mtcars[1:15,])



