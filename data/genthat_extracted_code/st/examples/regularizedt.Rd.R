library(st)


### Name: regularizedt
### Title: Various (Regularized) t Statistics
### Aliases: efront.stat efront.fun sam.stat sam.fun samL1.stat samL1.fun
###   modt.stat modt.fun
### Keywords: univar

### ** Examples

# load st library 
library("st")

# load Choe et al. (2005) data
data(choedata)
X <- choe2.mat
dim(X) # 6 11475  
L <- choe2.L
L

# L may also contain some real labels
L = c("group 1", "group 1", "group 1", "group 2", "group 2", "group 2")


# Efron t statistic (90 % rule)
score = efront.stat(X, L)
order(score^2, decreasing=TRUE)[1:10]
# [1]  4790 10979 11068  1022    50   724  5762    43 10936  9939

# sam statistic
# (requires "samr" package)
#score = sam.stat(X, L)
#order(score^2, decreasing=TRUE)[1:10]
#[1]  4790 10979  1022  5762    35   970    50 11068 10905  2693

# improved sam statistic
#score = samL1.stat(X, L)
#order(score^2, decreasing=TRUE)[1:10]
#[1]  1  2  3  4  5  6  7  8  9 10
# here all scores are zero!

# moderated t statistic
# (requires "limma" package)
#score = modt.stat(X, L)
#order(score^2, decreasing=TRUE)[1:10]
# [1]  4790 10979  1022  5762    35    50 11068   970 10905    43

# shrinkage t statistic
score = shrinkt.stat(X, L)
order(score^2, decreasing=TRUE)[1:10]
#[1] 10979 11068    50  1022   724  5762    43  4790 10936  9939



