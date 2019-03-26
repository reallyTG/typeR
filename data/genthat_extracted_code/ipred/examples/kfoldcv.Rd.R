library(ipred)


### Name: kfoldcv
### Title: Subsamples for k-fold Cross-Validation
### Aliases: kfoldcv
### Keywords: misc

### ** Examples


# 10-fold CV with N = 91

kfoldcv(10, 91)	

## Don't show: 
k <- sample(5:15, 1)
k
N <- sample(50:150, 1)
N
stopifnot(sum(kfoldcv(k, N)) == N)
## End(Don't show)




