library(sizeMat)


### Name: plot.gonadMat
### Title: Plot method for gonadMat class (size at gonad maturity)
### Aliases: plot.gonadMat

### ** Examples

data(matFish)

gonad_mat = gonad_mature(matFish, varNames = c("total_length", "stage_mat"), inmName = "I", 
matName = c("II", "III", "IV"), method = "fq", niter = 50)

plot(gonad_mat, xlab = "Total length (cm.)", ylab = "Proportion mature", col = c("blue", "red"))



