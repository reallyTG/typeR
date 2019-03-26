library(GenBinomApps)


### Name: GenBinomApps-package
### Title: Clopper-Pearson Confidence Interval and Generalized Binomial
###   Distribution
### Aliases: GenbinomApps-package GenBinomApps

### ** Examples

## n1=100, n2=100, n3=200, p1=0.001, p2=0.005, p3=0.01 
dgbinom(c(0:2),size=c(100,100,200),prob=c(0.001,0.005,0.01))
#  0.07343377 0.19260317 0.25173556
pgbinom(2,size=c(100,100,200),prob=c(0.001,0.005,0.01),lower.tail=FALSE)
# 0.4822275


## n=110000 tested devices, 2 failures divided in 2 failure types k1=1, k2=1.
## 2 countermeasures with effectivities p1=0.5, p2=0.8
cm.clopper.pearson.ci(110000,size=c(1,1), cm.effect=c(0.5,0.8))
# Confidence.Interval = upper
# Lower.limit = 0
# Upper.limit = 3.32087e-05
# alpha = 0.1

## target failure probability p=0.00001, 2 failures divided in 2 failure types k1=1, k2=1.
## 2 countermeasures with effectivities p1=0.5, p2=0.8
cm.n.clopper.pearson(0.00001,size=c(1,1), cm.effect=c(0.5,0.8))
# 365299



