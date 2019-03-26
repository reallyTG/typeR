library(st)


### Name: studentt.stat
### Title: (Paired) Student t Statistic
### Aliases: studentt.stat studentt.fun
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

# student t statistic (equal variances)
score = studentt.stat(X, L)
order(score^2, decreasing=TRUE)[1:10]
# [1] 11068   724  9990 11387 11310  9985  9996 11046    43    50

# the same computed with standard R methods (slower!)
#score2 = apply(X, 2, function(x) t.test(x ~ L, var.equal=TRUE)$statistic)
#sum((score-score2)^2)

# student t statistic (unequal variances)
score = studentt.stat(X, L, var.equal=FALSE)
order(score^2, decreasing=TRUE)[1:10]
# [1] 11068   724  9990 11387 11310  9985  9996 11046    43    50

# the same computed with standard R methods (slower!)
#score2 = apply(X, 2, function(x) t.test(x ~ L, var.equal=FALSE)$statistic)
#sum((score-score2)^2)

# paired student t statistic
score = studentt.stat(X, L, paired=TRUE)
order(score^2, decreasing=TRUE)[1:10]
# [1] 9985  7239  5393 11387 11310  9942 10238  9996 11015 11276

# the same computed with standard R methods (slower!)
#score2 = apply(X, 2, function(x) t.test(x ~ L, paired=TRUE)$statistic)
#sum((score-score2)^2)



