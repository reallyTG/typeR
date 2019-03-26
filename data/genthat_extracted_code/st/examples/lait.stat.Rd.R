library(st)


### Name: lait.stat
### Title: Correlation-Predicted t-Statistic
### Aliases: lait.stat lait.fun lai.tscore
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

# compute correlation-predicted t-score for various choices
# of smoothing span 

## Not run: 
##D 
##D score1 = lait.stat(X, L, f=0.1)
##D idx1 = order(abs(score1), decreasing=TRUE)
##D idx1[1:10]
##D # 1072  297 1130 4495 4523 4041 1089  955  373 3848
##D 
##D score3 = lait.stat(X, L, f=0.3)
##D idx3 = order(abs(score3), decreasing=TRUE)
##D idx3[1:10]
##D # 1130  962 1688 1223  583 1118  955  297  698 1219
##D 
##D score5 = lait.stat(X, L, f=0.5)
##D idx5 = order(abs(score5), decreasing=TRUE)
##D idx5[1:10]
##D #  698  962 1223 1219  739 1172  583  694 3785 3370 
##D 
##D score7 = lait.stat(X, L, f=0.7)
##D idx7 = order(abs(score7), decreasing=TRUE)
##D idx7[1:10]
##D #  698  739 1219  962 3785  725  694  735 3370 1172
##D 
##D 
##D # pick the one with highest correlation to Student t score
##D t = studentt.stat(X, L)
##D cor(t, score1, method="spearman") # 0.4265832
##D cor(t, score3, method="spearman") # 0.471273
##D cor(t, score5, method="spearman") # 0.4750564
##D cor(t, score7, method="spearman") # 0.4666669
##D 
##D # focus on gene 19
##D t = studentt.stat(X, L)
##D R = cor(centroids(X, L, lambda.var=0, centered.data=TRUE,
##D               verbose=TRUE)$centered.data)
##D 
##D lai.tscore(gene=19, t, R, f=0.5, plot=TRUE)
##D 
## End(Not run)



