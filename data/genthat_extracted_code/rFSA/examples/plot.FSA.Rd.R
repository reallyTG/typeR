library(rFSA)


### Name: plot.FSA
### Title: Diagnostic Plots for FSA solutions
### Aliases: plot.FSA

### ** Examples

#use mtcars package see help(mtcars)
data(mtcars)
colnames(mtcars)
fit<-lmFSA(formula="mpg~hp*wt",data=mtcars,fixvar="hp",
           quad=FALSE,m=2,numrs=10,save_solutions=FALSE,cores=1)
plot(x=fit)



