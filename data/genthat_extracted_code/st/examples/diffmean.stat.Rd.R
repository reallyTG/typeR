library(st)


### Name: diffmean.stat
### Title: Difference of Means ("Fold Change") and Rank Products Statistic
### Aliases: diffmean.stat diffmean.fun rankprod.stat rankprod.fun
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


# difference of means resp. fold change statistic
score = diffmean.stat(X, L)
order(abs(score), decreasing=TRUE)[1:10]
# [1]  4790  6620  1022 10979   970    35  2693  5762  5885     2

# two-sided rank products statistic
score = rankprod.stat(X, L)
order(score, decreasing=TRUE)[1:10]
# [1]  4790  1022 10979  6620    35  2693   970  5762  5885     2




