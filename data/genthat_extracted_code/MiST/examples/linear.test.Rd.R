library(MiST)


### Name: linear.test
### Title: Mixed effects Score Test for continuous outcomes
### Aliases: linear.test

### ** Examples


data(MiST.data)
attach(MiST.data)

##########################################################################
# Test the association between a set of SNPs and continuous outcomes    
#   - without information about SNP characteristics. Z is a vector of 1's.          


out <- linear.test(y.con, X, G, Z) 


##########################################################################
# Test the association between a set of SNPs and continuous outcomes    
#	- including SNP characteristics           


out <- linear.test(y.con, X, G, Z.func) 





