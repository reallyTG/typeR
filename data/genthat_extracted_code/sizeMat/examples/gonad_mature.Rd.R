library(sizeMat)


### Name: gonad_mature
### Title: Estimate gonadal maturity
### Aliases: gonad_mature

### ** Examples

data(matFish)

gonad_mat = gonad_mature(matFish, varNames = c("total_length", "stage_mat"), inmName = "I", 
matName = c("II", "III", "IV"), method = "fq", niter = 50)

# 'niter' parameters:
gonad_mat$A_boot
gonad_mat$B_boot
gonad_mat$L50_boot
gonad_mat$out



