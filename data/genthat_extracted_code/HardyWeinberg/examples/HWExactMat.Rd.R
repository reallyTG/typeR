library(HardyWeinberg)


### Name: HWExactMat
### Title: Matrix version of HWExact
### Aliases: HWExactMat
### Keywords: htest

### ** Examples

X <- HWData(100,10)
colnames(X) <- c("MM","MN","NN")
Results <- HWExactMat(X)
Output <- cbind(X,Results$pvalvec)
print(Output)



