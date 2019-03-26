library(HardyWeinberg)


### Name: HWChisqMat
### Title: Matrix version of HWChisq
### Aliases: HWChisqMat
### Keywords: htest

### ** Examples

X <- HWData(100,10)
colnames(X) <- c("MM","MN","NN")
Results <- HWChisqMat(X)
Output <- cbind(X,Results$chisqvec,Results$pvalvec)
print(Output)



