library(GenBinomApps)


### Name: Generalized Binomial
### Title: The Generalized Binomial Distribution
### Aliases: 'Generalized Binomial' dgbinom pgbinom qgbinom rgbinom

### ** Examples


## n=10 defect devices, divided in 3 failure types n1=2, n2=5, n3=3.
## 3 countermeasures with effectivities p1=0.8, p2=0.7, p3=0.3 are available.
## use dgbinom() to get the probabilities for x=0,...,10 failures solved.
dgbinom(x=c(0:10),size=c(2,5,3),prob=c(0.8,0.7,0.3))

## generation of N=100000 random values
rgbinom(100000,size=c(2,5,3),prob=c(0.8,0.7,0.3))


## n1=100, n2=100, n3=200, p1=0.001, p2=0.005, p3=0.01 
dgbinom(c(0:2),size=c(100,100,200),prob=c(0.001,0.005,0.01))
#  0.07343377 0.19260317 0.25173556
pgbinom(2,size=c(100,100,200),prob=c(0.001,0.005,0.01),lower.tail=FALSE)
# 0.4822275



