library(rFSA)


### Name: fitted.FSA
### Title: Fitted Values for FSA solutions
### Aliases: fitted.FSA

### ** Examples

#use mtcars package see help(mtcars)
data(mtcars)
colnames(mtcars)
fit<-lmFSA(formula="mpg~hp*wt",data=mtcars,fixvar="hp",
             quad=FALSE,m=2,numrs=10,save_solutions=FALSE,cores=1)
fitted(fit)



