library(matrixTests)


### Name: ttest
### Title: t-test
### Aliases: ttest row_t_onesample col_t_onesample row_t_equalvar
###   col_t_equalvar row_t_welch col_t_welch row_t_paired col_t_paired

### ** Examples

X <- iris[iris$Species=="setosa",1:4]
Y <- iris[iris$Species=="virginica",1:4]
col_t_welch(X, Y)

# same row using different confidence levels
col_t_equalvar(X[,c(1,1,1)], Y[,c(1,1,1)], conf.level=c(0.9, 0.95, 0.99))




