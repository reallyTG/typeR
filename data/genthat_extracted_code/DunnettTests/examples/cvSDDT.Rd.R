library(DunnettTests)


### Name: cvSDDT
### Title: To calculate the critical constants for step-down Dunnett test
###   procedure
### Aliases: cvSDDT
### Keywords: step-down Dunnett critical value

### ** Examples

#To test four hypotheses, the test statistics are 
#2.2 (H1), 2.7 (H2), 2.1(H3), 0.85(H4), respectively. 
#The test statistcis are equally correlated at 0.6 and have df=30. 
#At overall one-sided significance level 0.05, the critical constants are given by:

cvSDDT(k=4,df=30,corr=0.6)

#based on the critical values, we reject H2, H1, H3 in a sequence and accept H4.



