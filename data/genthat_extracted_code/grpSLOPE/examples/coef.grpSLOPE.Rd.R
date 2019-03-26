library(grpSLOPE)


### Name: coef.grpSLOPE
### Title: Extract model coefficients
### Aliases: coef.grpSLOPE

### ** Examples

set.seed(1)
A   <- matrix(rnorm(100^2), 100, 100)
grp <- rep(rep(letters[1:20]), each=5)
b   <- c(rep(1, 20), rep(0, 80))
y   <- A %*% b + rnorm(10) 
result <- grpSLOPE(X=A, y=y, group=grp, fdr=0.1)
head(coef(result), 8)
#       a_1       a_2       a_3       a_4       a_5       b_1       b_2       b_3 
#  7.942177  7.979269  8.667013  8.514861 10.026664  8.963364 10.037355 10.448692 
head(coef(result, scaled = FALSE), 8)
# (Intercept)         a_1         a_2         a_3         a_4         a_5         b_1         b_2 
#  -0.4418113   0.8886878   0.8372108   0.8422089   0.8629597   0.8615827   0.9323849   0.9333445 




