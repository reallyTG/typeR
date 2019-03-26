library(Partiallyoverlapping)


### Name: Prop.test
### Title: The partially overlapping samples z-test for dichotomous
###   variables
### Aliases: Prop.test

### ** Examples


# Example taken from Derrick, Dobson-Mckittrick, Toher and White, (2015)
# Test statistics for comparing two proportions with partially overlapping
# samples. Journal of Applied Quantitative Methods, 10(3) 
 
#The proportions for two groups, "a" and "b" are compared 
#where the raw data "1", or "0" for each unit is recorded in a data frame.
#The 15 paired observations in this example are given first,
#followed by 9 independent observations in Sample 1, 
#followed by 6 independent observations in Sample 2
#Independent observations and the paired samples stacked for each sample:
a<-c(1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,NA,NA,NA,NA,NA,NA)
b<-c(1,1,1,1,1,1,1,1,0,1,1,1,0,0,0,NA,NA,NA,NA,NA,NA,NA,NA,NA,1,1,1,1,1,1)
Prop.test(a,b,stacked=TRUE,conf.level=.95) #Perfroms the robust 'z8' test.
#p.value = 0.053



