library(ExactCIdiff)


### Name: Exact one-sided and two-sided 1-alpha confidence interval for two dependent proportions
### Title: Inductive confidence intervals for the difference between two
###   proportions
### Aliases: PairedCI

### ** Examples



#lower one-sided confidence intervals in Table 1 of Wang 2012 
PairedCI(3,1,0,conf.level=0.95,CItype="Lower")
PairedCI(2,0,2,conf.level=0.95,CItype="Lower")

#Upper one-sided confidence intervals for the difference of two dependent proportions
PairedCI(3,1,0,CItype="Upper",conf.level=0.95)
PairedCI(1,1,2,CItype="Upper",conf.level=0.9,grid.one=40,grid.two=25)

#Two-sided 90% confidence intervals
PairedCI(3,1,0,CItype='Two.sided',conf.level=0.9)




