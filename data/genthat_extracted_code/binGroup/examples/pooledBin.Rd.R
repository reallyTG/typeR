library(binGroup)


### Name: pooledBin
### Title: Confidence intervals for a single proportion
### Aliases: pooledBin
### Keywords: htest

### ** Examples


# Consider an imaginary example, where pools of size
# 1, 5, 10 and 50 are tested, 5 pools of each size
# among the 5 pools with size 1 and 5, no pool is positive,
# while among the 5 pools of size 10 and 50, 1 and 2 positive
# pools are identified, respectively. 

x1 <- c(0,0,1,2)
m1 <- c(1,5,10,50)
n1 <- c(5,5,5,5)

pooledBin(x=x1, m=m1, n=n1)
pooledBin(x=x1, m=m1, n=n1, scale=1000)

pooledBin(x=x1, m=m1, n=n1)

summary(pooledBin(x=x1, m=m1, n=n1), scale=1000)

# For another population, tested with the same design, one might find:
# 1 positive result among the pools pooling 5 elements,
# no positive result among the pools pooling 10 elements,
# 4 positive results among the pools pooling 50 elements,

x2<-c(0,1,0,4)
m2 <- c(1,5,10,50)
n2 <- c(5,5,5,5)

pooledBin(x=x2, m=m2, n=n2)

# Some other methods for the confidence bounds:

pooledBin(x=x2, m=m2, n=n2, ci.method="lrt")


###
# Reproducing some of the estimates from Table 1 in
# Hepworth & Biggerstaff (2017):

pooledBin(x=c(1,2), m=c(20,5), n=c(8,8), pt.method="firth", ci.method="lrt")

pooledBin(x=c(7,8), m=c(20,5), n=c(8,8), pt.method="firth", ci.method="lrt")




