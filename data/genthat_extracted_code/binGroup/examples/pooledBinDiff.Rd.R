library(binGroup)


### Name: pooledBinDiff
### Title: Confidence intervals for the difference of proportions
### Aliases: pooledBinDiff
### Keywords: htest pooled testing

### ** Examples


# Consider an imaginary example, where pools of size
# 1, 5, 10 and 50 are tested, 5 pools of each size. The same 
# design is applied to estimate the prevalence in
# two populations: 
# In population 1, among the 5 pools with size 1 and 5,
# no positive pool is observed,
# while among the 5 pools of size 10 and 50, 1 and 2 positive
# pools are identified, respectively.
 
# In population 2, 1 positive result is observed
# among the 5 pools each pooling 5 elements,
# no positive result among the pools pooling 10 elements,
# 4 positive results among the pools pooling 50 elements,

x1 <- c(0,0,1,2)
m <- c(1,5,10,50)
n <- c(5,5,5,5)

x2<-c(0,1,0,4)

pooledBinDiff(x1=x1, m1=m, x2=x2, m2=m, n1=n, n2=n)

summary(pooledBinDiff(x1=x1, m1=m, x2=x2, m2= m, n1=n, n2=n), scale=1000)

# Compare recommended methods:

pooledBinDiff(x1=x1, m1=m, x2=x2, m2= m, n1=n, n2=n, pt.method="mle",
 ci.method="lrt")

pooledBinDiff(x1=x1, m1=m, x2=x2, m2= m, n1=n, n2=n, pt.method="mle",
 ci.method="score") 

pooledBinDiff(x1=x1, m1=m, x2=x2, m2= m, n1=n, n2=n, pt.method="mle",
 ci.method="skew-score")
  



