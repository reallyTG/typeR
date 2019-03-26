library(st)


### Name: shrinkcat.stat
### Title: Correlation-Adjusted t Score (CAT score)
### Aliases: shrinkcat.stat shrinkcat.fun
### Keywords: multivar

### ** Examples

# load st library 
library("st")

# prostate data set
data(singh2002)
X = singh2002$x
L = singh2002$y

dim(X)      # 102 6033 
length(L)   # 102


# shrinkage cat statistic
score = shrinkcat.stat(X, L)
idx = order(score^2, decreasing=TRUE)
idx[1:10]
# 610  364 1720 3647 3375  332 3282 3991 1557  914

# compute q-values and local false discovery rates
library("fdrtool")
fdr.out = fdrtool(as.vector(score))
sum(fdr.out$qval < 0.05)
sum(fdr.out$lfdr < 0.2)


# compared with:

# shrinkage t statistic 
score = shrinkt.stat(X, L)
idx = order(score^2, decreasing=TRUE)
idx[1:10]
# 610 1720 3940  914  364  332 3647 4331  579 1068

# shrinkage CAT score with zero correlation among predictors
# is the same as shrinkage t
score2 = shrinkcat.stat(X, L, lambda=1)
sum((score2-score)^2)


# Student t statistic
score = studentt.stat(X, L)
idx = order(score^2, decreasing=TRUE)
idx[1:10]
# 610 1720  364  332  914 3940 4546 1068  579 4331

# shrinkage CAT score with zero correlation and no shrinkage 
# is the same as student t
score2 = shrinkcat.stat(X, L, lambda=1, lambda.var=0, lambda.freqs=0,
  verbose=FALSE)
sum((score2-score)^2)


# difference of means ("Fold Change")
score = diffmean.stat(X, L)
idx = order(abs(score), decreasing=TRUE)
idx[1:10]
# 735  610  694  298  698  292  739 3940  702  721


## paired CAT score

# we drop two cancer cases to make samples size equal in
# the two groups to allow to compute paired statistic
X = X[1:100,]
L = L[1:100]
sum(L=="cancer") # 50
sum(L=="healthy") # 50

# paired shrinkage CAT score
scat.paired = shrinkcat.stat(X, L, paired=TRUE)

# for zero correlation the paired shrinkage CAT score
# reduces to the paired shrinkage t score
score = shrinkt.stat(X, L, paired=TRUE, verbose=FALSE)
score2 = shrinkcat.stat(X, L, lambda=1, paired=TRUE, verbose=FALSE)
sum((score-score2)^2)




