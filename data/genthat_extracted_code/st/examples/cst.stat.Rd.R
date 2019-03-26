library(st)


### Name: cst.stat
### Title: Correlation-Shared t-Statistic
### Aliases: cst.stat cst.fun
### Keywords: univar

### ** Examples

# load st library 
library("st")

# prostate data set
data(singh2002)
X = singh2002$x
L = singh2002$y

dim(X)      # 102 6033 
length(L)   # 102

# correlation shared t statistic
## Not run: 
##D score = cst.stat(X, L)
##D idx = order(abs(score), decreasing=TRUE)
##D idx[1:10]
##D # [1]  610 1720  364  332  914 3940 4546 1068  579 4331
## End(Not run)

# compared with:

# Student t statistic
score = studentt.stat(X, L)
idx = order(abs(score), decreasing=TRUE)
idx[1:10]
# [1]  610 1720  364  332  914 3940 4546 1068  579 4331


# for the same example using the shrinkage cat score see shrinkcat.stat() 




