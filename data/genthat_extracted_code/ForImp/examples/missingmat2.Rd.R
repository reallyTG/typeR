library(ForImp)


### Name: missingmat2
### Title: Random generation of missing values
### Aliases: missingmat2
### Keywords: multivariate datagen

### ** Examples

mat<-matrix(rnorm(500),100,5)
# if you want 20 rows with 1 missing, 10 rows with 2 missing,
# 4 rows with 3 missing, 1 row with 4 missing
missing<-c(20,10,4,1)
matm<-missingmat2(mat, missing)
matm
# check that the function works
missingness(matm)



