library(eqtl)


### Name: gpt
### Title: Global Permutation Threshold
### Aliases: gpt
### Keywords: models

### ** Examples


data(seed10);

# Compute the global permutation test with 1000 permutations on 100 individuals
## Not run: out_1000.gpt <- gpt(seed10,100,1000);

# Compute the global permutation threshold with 100 permutations on 100 individuals
out_100.gpt <- gpt(seed10, 10, 10)

out_100.gpt

# Significance LOD threshold value with alpha at 0.05 (5%)
## Not run: th_1000 <- as.numeric(out_1000.gpt)[order(out_1000.gpt,decreasing=TRUE)][5000];
 th_100 <- as.numeric(out_100.gpt)[order(out_100.gpt,decreasing=TRUE)][5];

th_100

hist(unclass(out_100.gpt),nclass=50,col='gray')
abline(v=th_100,col='red')

# out.em <- scanone(seed10, method='hk', chr=c(1:5));
## Not run: 
##D plot(out.em, chr=c(1:5));
##D add.threshold(out.em, chr=c(1:5), perms=out_1000.gpt, alpha=0.05);
##D add.threshold(out.em, chr=c(1:5), perms=out_1000.gpt, alpha=0.1, col="green");
## End(Not run)




