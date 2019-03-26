library(st)


### Name: shrinkt.stat
### Title: The Shrinkage t Statistic
### Aliases: shrinkt.stat shrinkt.fun
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

# shrinkage t statistic (equal variances)
score = shrinkt.stat(X, L)
order(score^2, decreasing=TRUE)[1:10]

# [1] 10979 11068    50  1022   724  5762    43  4790 10936  9939
#  lambda.var (variances):  0.3882
#  lambda.freqs (frequencies):  1

# shrinkage t statistic (unequal variances)
score = shrinkt.stat(X, L, var.equal=FALSE)
order(score^2, decreasing=TRUE)[1:10]

# [1] 11068    50 10979   724    43  1022  5762 10936  9939  9769
#  lambda.var class #1 and class #2 (variances):  0.3673   0.3362
#  lambda.freqs (frequencies): 1

# compute q-values and local false discovery rates
library("fdrtool")
fdr.out = fdrtool(score) 
sum( fdr.out$qval < 0.05 )
sum( fdr.out$lfdr < 0.2 )
fdr.out$param


# computation of paired t-score

# paired shrinkage t statistic
score = shrinkt.stat(X, L, paired=TRUE)
order(score^2, decreasing=TRUE)[1:10]
# [1] 50  4790  5393 11068  5762 10238  9939   708   728    68


# if there is no shrinkage the paired shrinkage t score reduces
# to the conventional paired student t statistic
score = studentt.stat(X, L, paired=TRUE)
score2 = shrinkt.stat(X, L, lambda.var=0, lambda.freqs=0, paired=TRUE, verbose=FALSE)
sum((score-score2)^2)




