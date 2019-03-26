library(rFSA)


### Name: print.FSA
### Title: Printing function for FSA solutions
### Aliases: print.FSA

### ** Examples

#use mtcars package see help(mtcars)
data(mtcars)
colnames(mtcars)
fit<-lmFSA(formula="mpg~hp*wt",data=mtcars,fixvar="hp",
                   quad=FALSE,m=2,numrs=10,save_solutions=FALSE,cores=1)
print(fit)



