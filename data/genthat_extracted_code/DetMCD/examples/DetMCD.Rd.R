library(DetMCD)


### Name: DetMCD
### Title: Robust and Deterministic Location and Scatter Estimation via
###   DetMCD
### Aliases: DetMCD
### Keywords: multivariate robust deterministic

### ** Examples

## generate data
set.seed(1234)  # for reproducibility
alpha<-0.5
n<-101
p<-5
#generate correlated data
D<-diag(rchisq(p,df=1))
W<-matrix(0.9,p,p)
diag(W)<-1
W<-D
V<-chol(W)
x<-matrix(rnorm(n*p),nc=p)
x<-scale(x)


result<-DetMCD(x,scale_est="tau",alpha=alpha)
plot(result, which = "dd")

#compare to robustbase:
result<-DetMCD(x,scale_est="qn",alpha=alpha)
resultsRR<-covMcd(x,nsamp='deterministic',scalefn=qn,alpha=alpha)
#should be the same:
result$crit
resultsRR$crit


#Example with several values of alpha:
alphas<-seq(0.5,1,l=6)
results<-DetMCD(x,scale_est="qn",alpha=alphas)
plot(results, h.val = 2, which = "dd")



