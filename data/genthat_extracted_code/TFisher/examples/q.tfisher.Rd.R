library(TFisher)


### Name: q.tfisher
### Title: Quantile of thresholding Fisher's p-value combination statistic
###   under the null hypothesis.
### Aliases: q.tfisher

### ** Examples

## The 0.05 critical value of TFisher statistic when n = 10:
q.tfisher(p=.95, n=20, tau1=0.05, tau2=0.25)
## when corrrelated
M = matrix(0.3,20,20) + diag(1-0.3,20)
q.tfisher(p=.95, n=20, tau1=0.05, tau2=0.25, M=M)



