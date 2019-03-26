library(ExactCIdiff)


### Name: Exact one-sided and two-sided 1-alpha confidence interval two independent proportions
### Title: Inductive confidence intervals for the difference between two
###   proportions
### Aliases: BinomCI

### ** Examples


#lower one-sided confidence interval with n1=4,n2=1,x=2,and y=0 in Wang 2010 
BinomCI(4,1,2,0,CItype="Lower")

#Upper one-sided confidence interval with n1=4,n2=1,x=2,and y=0.
BinomCI(4,1,2,0,CItype="Upper")


#Two-sided 90% confidence intervals
BinomCI(5,5,4,2,conf.level=0.9,CItype='Two.sided')




