library(sigr)


### Name: permutationScoreModel
### Title: Empirical permutation test of significance of
###   scoreFn(modelValues,yValues) >= scoreFn(modelValues,perm(yValues)).
### Aliases: permutationScoreModel

### ** Examples


set.seed(25325)
y <- 1:5
m <- c(1,1,2,2,2)
cor.test(m,y,alternative='greater')
f <- function(modelValues,yValues) cor(modelValues,yValues)
permutationScoreModel(m,y,f)




