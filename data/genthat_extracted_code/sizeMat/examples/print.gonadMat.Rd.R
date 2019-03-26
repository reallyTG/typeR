library(sizeMat)


### Name: print.gonadMat
### Title: Print method for gonadMat class (size at gonad maturity)
### Aliases: print.gonadMat

### ** Examples

data(matFish)

gonad_mat = gonad_mature(matFish, varNames = c("total_length", "stage_mat"), inmName = "I", 
matName = c("II", "III", "IV"), method = "fq", niter = 50)

print(gonad_mat)



