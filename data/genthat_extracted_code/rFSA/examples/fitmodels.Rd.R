library(rFSA)


### Name: fitmodels
### Title: Model fitting function for FSA solutions
### Aliases: fitmodels

### ** Examples

#use mtcars package see help(mtcars)
data(mtcars)
colnames(mtcars)
fit<-lmFSA(formula="mpg~hp*wt",data=mtcars,fixvar="hp",
     quad=FALSE,m=2,numrs=10,save_solutions=FALSE,cores=1)
fitmodels(fit)



