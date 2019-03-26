library(Partiallyoverlapping)


### Name: Partover.test
### Title: The partially overlapping samples t-test
### Aliases: Partover.test

### ** Examples


# Example taken from Derrick, Toher and White (2017)
# How to compare the means of two samples that include
# paired observations and independent observations:
# A companion to Derrick, Russ, Toher and White (2017).
# The Quantitative Methods in Psychology, 13(2). pp.120-126.

#The sample means for two groups, "a" and "b" are compared
#for a two sided test assuming equal variances.

#Approach 1:
#For each sample, unpaired observations and paired observations defined as separate vectors:
a.unpaired<-c(20,21,16,18,14,12,14,17)
a.paired<-c(14,15,18,20,11,19,14,15)
b.unpaired<-c(10,16,18,16,15,14,13,10)
b.paired<-c(15,10,15,17,13,19,12,13)
Partover.test(a.unpaired,b.unpaired,a.paired,b.paired,var.equal=TRUE) 
#p.value = 0.026, the samples from group "a" and group "b" have significantly different means

#Equivalently, Approach 2:
#Independent observations and the paired samples stacked for each sample:
a<-c(20,21,16,18,14,12,14,17,NA,NA,NA,NA,NA,NA,NA,NA,14,15,18,20,11,19,14,15)
b<-c(NA,NA,NA,NA,NA,NA,NA,NA,10,16,18,16,15,14,13,10,15,10,15,17,13,19,12,13)
Partover.test(a,b,var.equal=TRUE,stacked=TRUE) 
#p.value = 0.026, the samples from group "a" and group "b" have significantly different means




