library(cem)


### Name: k2k
### Title: Reduction to k2k Matching
### Aliases: k2k
### Keywords: multivariate datagen

### ** Examples

data(LL)

# cem match: automatic bin choice
mat <- cem(treatment="treated", data=LL, drop="re78", keep.all=TRUE)
mat
mat$k2k

# ATT estimate
att(mat, re78 ~ treated, data=LL)


# transform the match into k2k
mat2 <- k2k(mat, LL, "euclidean", 1)
mat2
mat2$k2k

# ATT estimate after k2k
att(mat2, re78 ~ treated, data=LL)



